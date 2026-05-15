<?php
session_start();
$conn = new mysqli("localhost", "root", "", "tripops_db");
if ($conn->connect_error) die("DB connection error");

if(!isset($_SESSION['created_trip_id'])){
    header("Location: trip_dashboard.php");
    exit();
}

$trip_id = $_SESSION['created_trip_id'];

$stmt = $conn->prepare("SELECT destination_slug, start_date, end_date FROM trips WHERE id=?");
$stmt->bind_param("i", $trip_id);
$stmt->execute();
$trip = $stmt->get_result()->fetch_assoc();
if(!$trip) die("Trip not found");

$start = new DateTime($trip['start_date']);
$end = new DateTime($trip['end_date']);
$total_days = $start->diff($end)->days + 1;
if($total_days < 1) $total_days = 1;

$slug = $trip['destination_slug'];
$stmt2 = $conn->prepare("SELECT * FROM destination_details WHERE slug=? LIMIT 1");
$stmt2->bind_param("s", $slug);
$stmt2->execute();
$dest = $stmt2->get_result()->fetch_assoc();
if(!$dest) die("Destination not found");

$dest_id = $dest['id'];

$attractions = $conn->query("SELECT * FROM destination_attractions WHERE destination_id=$dest_id ORDER BY display_order ASC")->fetch_all(MYSQLI_ASSOC);
$experiences = $conn->query("SELECT * FROM destination_experiences WHERE destination_id=$dest_id")->fetch_all(MYSQLI_ASSOC);
$restaurants = $conn->query("SELECT * FROM destination_restaurants WHERE destination_id=$dest_id")->fetch_all(MYSQLI_ASSOC);

/* ===============================
   AUTO GENERATE INITIAL PLAN
================================ */
if(!isset($_SESSION['editable_plan']) || count($_SESSION['editable_plan']) != $total_days){
    $plan = [];
    $a_i=0; $e_i=0; $r_i=0;

    for($d=1;$d<=$total_days;$d++){
        $timeline=[];

        // Breakfast
        if(isset($restaurants[$r_i])){
            $timeline[]=['type'=>'Restaurant','data'=>$restaurants[$r_i++ % count($restaurants)],'start'=>'08:00','end'=>'09:00'];
        }

        // Morning attractions
        $morning_slots = min(2, count($attractions)-$a_i);
        for($i=0;$i<$morning_slots;$i++){
            if(isset($attractions[$a_i])){
                $timeline[]=['type'=>'Attraction','data'=>$attractions[$a_i++ % count($attractions)],'start'=>'09:30','end'=>'11:00'];
            }
        }

        // Lunch
        if(isset($restaurants[$r_i])){
            $timeline[]=['type'=>'Restaurant','data'=>$restaurants[$r_i++ % count($restaurants)],'start'=>'12:30','end'=>'13:30'];
        }

        // Afternoon experiences
        $afternoon_slots = min(2, count($experiences)-$e_i);
        for($i=0;$i<$afternoon_slots;$i++){
            if(isset($experiences[$e_i])){
                $timeline[]=['type'=>'Experience','data'=>$experiences[$e_i++ % count($experiences)],'start'=>'14:00','end'=>'16:00'];
            }
        }

        // Dinner
        if(isset($restaurants[$r_i])){
            $timeline[]=['type'=>'Restaurant','data'=>$restaurants[$r_i++ % count($restaurants)],'start'=>'20:00','end'=>'21:00'];
        }

        $plan[$d]['timeline']=$timeline;
    }

    $_SESSION['editable_plan']=$plan;
}

$generated_plan=$_SESSION['editable_plan'];

/* ===============================
   DELETE ITEM
================================ */
if(isset($_POST['delete_item'])){
    $day=$_POST['day'];
    $index=$_POST['index'];
    unset($_SESSION['editable_plan'][$day]['timeline'][$index]);
    $_SESSION['editable_plan'][$day]['timeline']=array_values($_SESSION['editable_plan'][$day]['timeline']);
    header("Location: itinerary.php");
    exit();
}

/* ===============================
   ADD CUSTOM ITEM
================================ */
if(isset($_POST['add_custom'])){
    $day = $_POST['day'];
    $type = $_POST['type'];
    $name = $_POST['name'];
    $start = $_POST['start'];
    $duration = ($type=="Attraction")?90:(($type=="Experience")?120:60);
    $end = date("H:i", strtotime($start) + ($duration*60));

    

    $_SESSION['editable_plan'][$day]['timeline'][]=[
        'type'=>$type,
        'data'=>['name'=>$name],
        'start'=>$start,
        'end'=>$end
    ];

    usort($_SESSION['editable_plan'][$day]['timeline'], function($a,$b){
        return strtotime($a['start'])-strtotime($b['start']);
    });

    header("Location: itinerary.php");
    exit();
}

/* ===============================
   DRAG & DROP UPDATE (CROSS-DAY)
================================ */
if(isset($_POST['update_plan'])){
    $new_plan = json_decode($_POST['plan'], true);
    $_SESSION['editable_plan'] = $new_plan;
    echo 'success';
    exit();
}
?>

<?php
// ... (your existing PHP code remains unchanged)
?>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Itinerary Planner</title>
<link rel="stylesheet" href="itinerary.css">
<!-- Include jsPDF library -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
</head>
<body>
<div class="container">
<h2>Itinerary Planner - <?= htmlspecialchars($dest['name']) ?> (<?= $total_days ?> days)</h2>
<div style="margin-bottom:20px;">
<a href="trip_dashboard.php">← Back to Trip Dashboard</a>
</div>

<?php foreach($generated_plan as $day=>$items): ?>
<div class="card">
<h4>Day <?= $day ?></h4>
<ul class="day-list" data-day="<?= $day ?>">
<?php foreach($items['timeline'] as $index=>$item): ?>
<li draggable="true" data-index="<?= $index ?>">
<?= htmlspecialchars($item['data']['name']) ?> <small>(<?= $item['type'] ?>)</small>
<span class="delete" onclick="deleteItem(<?= $day ?>,<?= $index ?>)">×</span>
</li>
<?php endforeach; ?>
</ul>
</div>
<?php endforeach; ?>
<!-- PDF Download Button -->
<button class="pdf-btn" onclick="downloadPDF()">Download PDF</button>

<h4>Add Custom Activity</h4>
<form method="POST" class="custom-form">
Day:
<select name="day">
<?php for($d=1;$d<=$total_days;$d++): ?>
<option value="<?= $d ?>">Day <?= $d ?></option>
<?php endfor; ?>
</select>

<select name="type">
<option value="Attraction">Attraction</option>
<option value="Experience">Experience</option>
<option value="Restaurant">Restaurant</option>
</select>

<input type="text" name="name" placeholder="Name" required>


<button name="add_custom">Add</button>
</form>

</div>

<script>
// DELETE ITEM
function deleteItem(day,index){
    let f = document.createElement('form');
    f.method='POST';
    f.innerHTML='<input type="hidden" name="day" value="'+day+'"><input type="hidden" name="index" value="'+index+'"><input type="hidden" name="delete_item" value="1">';
    document.body.appendChild(f);
    f.submit();
}

// DRAG & DROP CROSS-DAY
let draggedItem = null;

document.querySelectorAll('.day-list').forEach(ul=>{
    ul.addEventListener('dragstart', e=>{
        draggedItem = e.target;
        e.target.classList.add('dragging');
    });
    ul.addEventListener('dragend', e=>{
        draggedItem.classList.remove('dragging');
        draggedItem = null;
        updatePlan();
    });

    ul.addEventListener('dragover', e=>{
        e.preventDefault();
        const afterElement = getDragAfterElement(ul, e.clientY);
        if(afterElement==null){
            ul.appendChild(draggedItem);
        }else{
            ul.insertBefore(draggedItem, afterElement);
        }
    });
});

function getDragAfterElement(container, y){
    const draggableElements = [...container.querySelectorAll('li:not(.dragging)')];
    return draggableElements.reduce((closest, child)=>{
        const box = child.getBoundingClientRect();
        const offset = y - box.top - box.height/2;
        if(offset<0 && offset>closest.offset){
            return {offset:offset, element:child};
        }else{
            return closest;
        }
    }, {offset: Number.NEGATIVE_INFINITY}).element;
}

// SEND UPDATED PLAN TO SERVER
function updatePlan(){
    let plan = {};
    document.querySelectorAll('.day-list').forEach(ul=>{
        const day = ul.getAttribute('data-day');
        plan[day] = {timeline: []};
        ul.querySelectorAll('li').forEach(li=>{
            plan[day]['timeline'].push({
                type: li.querySelector('small').innerText.replace(/[()]/g,''),
                data:{name: li.childNodes[0].textContent.trim()},
            });
        });
    });

    let xhr = new XMLHttpRequest();
    xhr.open('POST','itinerary.php',true);
    xhr.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    xhr.send('update_plan=1&plan='+encodeURIComponent(JSON.stringify(plan)));
}

// PDF DOWNLOAD FUNCTION
function downloadPDF(){
    const { jsPDF } = window.jspdf;
    let doc = new jsPDF();
    let y = 10;
    doc.setFontSize(16);
    doc.text("Itinerary for <?= addslashes($dest['name']) ?>", 10, y);
    y += 10;
    <?php foreach($generated_plan as $day=>$items): ?>
        doc.setFontSize(14);
        doc.text("Day <?= $day ?>", 10, y); y+=7;
        <?php foreach($items['timeline'] as $item): ?>
            doc.setFontSize(12);
            doc.text("<?= addslashes($item['data']['name']) ?> (<?= $item['type'] ?>)", 12, y); y+=6;
        <?php endforeach; ?>
        y+=4;
    <?php endforeach; ?>
    doc.save("itinerary.pdf");
}
</script>
</body>
</html>
