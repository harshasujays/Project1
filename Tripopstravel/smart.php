<?php
session_start();
$conn = new mysqli("localhost", "root", "", "tripops_db");
if ($conn->connect_error) die("DB Error");
$user_id = $_SESSION['user_id'] ?? 1;
$trip_id = $_SESSION['created_trip_id'];
/* ===============================
   SERVER-SIDE SAVE LOGIC
================================*/


/* ===============================
   AJAX HANDLERS
================================*/
// Handle Checkbox Updates
if(isset($_POST['update_checklist'])){
    $stmt = $conn->prepare("UPDATE smart_packing_items SET is_packed = ? WHERE item_name = ? AND profile_id = (SELECT id FROM smart_packing_profiles WHERE trip_id = ? AND user_id = ?)");
    $stmt->bind_param("isii", $_POST['is_checked'], $_POST['item_id'], $trip_id, $user_id);
    $stmt->execute();
    echo json_encode(['success' => true]); exit;
}

// Handle Adding Custom Items
if(isset($_POST['add_custom_item'])){
    $p_res = $conn->query("SELECT id FROM smart_packing_profiles WHERE trip_id=$trip_id AND user_id=$user_id");
    $p_id = $p_res->fetch_assoc()['id'];
    $stmt = $conn->prepare("INSERT INTO smart_packing_items (profile_id, category, item_name, quantity, is_packed) VALUES (?, ?, ?, ?, 0)");
    $stmt->bind_param("issi", $p_id, $_POST['category'], $_POST['item_name'], $_POST['quantity']);
    $stmt->execute();
    echo json_encode(['success' => true, 'item' => $_POST['item_name'], 'quantity' => $_POST['quantity']]); exit;
}

// Handle Removing Items
if(isset($_POST['remove_item'])){
    $stmt = $conn->prepare("DELETE FROM smart_packing_items WHERE item_name = ? AND profile_id = (SELECT id FROM smart_packing_profiles WHERE trip_id = ? AND user_id = ?)");
    $stmt->bind_param("sii", $_POST['item_name'], $trip_id, $user_id);
    $stmt->execute();
    echo json_encode(['success' => true]); exit;
}

/* ===============================
   FETCH TRIP DETAILS
================================*/
$stmt = $conn->prepare("SELECT destination_slug, start_date, end_date FROM trips WHERE id=?");
$stmt->bind_param("i", $trip_id);
$stmt->execute();
$trip = $stmt->get_result()->fetch_assoc();

// ... (Rest of your climate and profile generation logic remains exactly the same) ...

$start = new DateTime($trip['start_date']);
$end = new DateTime($trip['end_date']);
$total_days = $start->diff($end)->days + 1;

if ($total_days > 10) {
    die("<h3>Smart Planning available only for trips up to 10 days.</h3>");
}

/* ===============================
   AUTO CLIMATE LOGIC
================================*/
$stmt2 = $conn->prepare("SELECT country FROM destinations WHERE slug=?");
$stmt2->bind_param("s", $trip['destination_slug']);
$stmt2->execute();
$dest = $stmt2->get_result()->fetch_assoc();

$country = strtolower($dest['country'] ?? '');
$coldCountries = ['switzerland', 'canada', 'norway', 'sweden'];
$hotCountries = ['uae', 'dubai', 'thailand', 'maldives', 'india'];

if (in_array($country, $coldCountries)) $climate_type = "cold";
elseif (in_array($country, $hotCountries)) $climate_type = "hot";
else $climate_type = "moderate";

$rain_level = "medium";
/* ===============================
   FETCH PROFILE & ITEMS
================================*/
$stmt_p = $conn->prepare("SELECT * FROM smart_packing_profiles WHERE user_id=? AND trip_id=?");
$stmt_p->bind_param("ii", $user_id, $trip_id);
$stmt_p->execute();
$profile = $stmt_p->get_result()->fetch_assoc();

// ADD THESE LINES HERE TO FIX "UNDEFINED BUDGET/PURPOSE"
if ($profile) {
    $purpose = $profile['trip_purpose'] ?? '';
    $gender  = $profile['gender'] ?? '';
    $budget  = $profile['budget_type'] ?? '';
} else {
    $purpose = $gender = $budget = '';
}
/* ===============================
   SAVE PROFILE & GENERATE
================================*/
if (isset($_POST['generate_plan'])) {
    $trip_purpose = $_POST['trip_purpose'];
    $gender       = $_POST['gender'];
    $budget       = $_POST['budget_type'];
    $laundry      = $_POST['laundry'];



    // Update or Insert Profile
$stmt3 = $conn->prepare("
INSERT INTO smart_packing_profiles
(user_id, trip_id, total_days, climate_type, rain_level, gender, laundry, trip_purpose, budget_type, created_at)
VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, NOW())
ON DUPLICATE KEY UPDATE
total_days=?, climate_type=?, rain_level=?, gender=?, laundry=?, trip_purpose=?, budget_type=?
");



$stmt3->bind_param(
    "iiissssssiiissss",
    $user_id,     // INSERT 1
    $trip_id,     // INSERT 2
    $total_days,  // INSERT 3
    $climate_type,// INSERT 4
    $rain_level,  // INSERT 5
    $gender,      // INSERT 6
    $laundry,     // INSERT 7
    $trip_purpose,// INSERT 8
    $budget,      // INSERT 9
    // UPDATE part
    $total_days,  // UPDATE 1
    $climate_type,// UPDATE 2
    $rain_level,  // UPDATE 3
    $gender,      // UPDATE 4
    $laundry,     // UPDATE 5
    $trip_purpose,// UPDATE 6
    $budget       // UPDATE 7
);





    $stmt3->execute();

    // Get the profile ID to clear items correctly
    $p_res = $conn->query("SELECT id FROM smart_packing_profiles WHERE trip_id=$trip_id AND user_id=$user_id");
    $p_id = $p_res->fetch_assoc()['id'];
    
    // Clear items using the correct column (profile_id)
    $conn->query("DELETE FROM smart_packing_items WHERE profile_id=$p_id");
    
    header("Location: smart.php?generated=1");
    exit();
}


?>

<!DOCTYPE html>
<html>
<head>
<title>Smart Packing Assistant</title>
<link rel="stylesheet" href="smart.css">
</head>
<body>

<div class="container">
<h2> Smart Packing Assistant</h2>

<?php if(!$profile){ ?>

<div class="card">
    <h3>Customize Your Packing Profile</h3>
    <form method="POST">
        <div class="form-group">
            <label>Trip Purpose:</label>
            <select name="trip_purpose" required>
                <option value="leisure">Leisure</option>
                <option value="business">Business</option>
                <option value="adventure">Adventure</option>
                <option value="religious">Traditional</option>
            </select>
        </div>

        <div class="form-group">
            <label>Gender:</label>
            <select name="gender" required>
                <option value="male">Male</option>
                <option value="female">Female</option>
            </select>
        </div>

        <div class="form-group">
            <label>Budget Preference:</label>
            <select name="budget_type" required>
                <option value="Low Budget">Affordable / Budget</option>
                <option value="Mid Range">Mid-Range</option>
                <option value="Luxury">Luxury / High-End</option>
            </select>
        </div>

        <div class="form-group">
            <label>Laundry Available?</label>
            <select name="laundry" required>
                <option value="yes">Yes (Can wash clothes)</option>
                <option value="no">No (Can't wash clothes)</option>
            </select>
        </div>
        <button type="submit" name="generate_plan">Generate Smart Plan ✓</button>
    </form>
</div>

<?php } else { ?>

<div class="card">
    <h3>📊 Trip Overview</h3>
    <div class="trip-info">
        <div class="info-item">
            <strong>Duration:</strong>
            <?= $profile['total_days'] ?> Days
        </div>
        <div class="info-item">
            <strong>Trip Type:</strong>
            <?= ucfirst(str_replace('_', ' ', $purpose)) ?>
        </div>
        <div class="info-item">
            <strong>Budget:</strong>
            <?= ucfirst($budget) ?>
        </div>
    </div>
</div>

<div style="margin-bottom: 20px;">
    <a href="trip_dashboard.php" class="back-btn">← Back to Trip Dashboard</a>
</div>

<div class="card">
    <h3>🎒 Recommended Packing Checklist</h3>
    <div style="display:flex;justify-content:flex-start;align-items:center;margin-bottom:12px;gap:12px;">
        <button id="addCustomToggle" type="button" class="back-btn">+ Add my own items</button>
    </div>
    <div id="customForm" style="display:none;margin-bottom:12px;">
        <input id="customCategory" placeholder="Category (e.g., Accessories)" style="padding:8px;border:1px solid #ddd;border-radius:6px;width:30%;margin-right:8px;">
        <input id="customItem" placeholder="Item name" style="padding:8px;border:1px solid #ddd;border-radius:6px;width:40%;margin-right:8px;">
        <input id="customQuantity" type="number" min="1" value="1" style="padding:8px;border:1px solid #ddd;border-radius:6px;width:10%;margin-right:8px;">
        <button id="addCustomBtn" type="button" class="back-btn">Add</button>
    </div>

<?php
$days = $profile['total_days'];
$laundry = $profile['laundry'];
$climate = $profile['climate_type'];
$rain = $profile['rain_level'];

/* Purpose, Gender, and Budget are fetched from trips table, not profile */
/* $purpose, $budget already set above */

/* ===== CALCULATE MULTIPLIERS ===== */
/* Budget Multiplier - Controls what items to include */
$budget_multiplier = 1.0;
if($budget == "Low Budget") $budget_multiplier = 0.6;
elseif($budget == "Mid Range") $budget_multiplier = 0.85;
elseif($budget == "Luxury") $budget_multiplier = 1.2;


/* Undergarment & Socks - Realistic counts */
$undergarment_count = ($laundry == "yes") ? ceil($days/2) : $days;
$undergarment_count = min($undergarment_count, 8); // Cap at 8 max

/* For females, increase undergarment count to account for bras + underwear */
if($gender == "female"){
    $bra_count = ($laundry == "yes") ? 2 : ceil($days/3); // 2-3 bras typically enough
    $bra_count = min($bra_count, 3); // Cap at 3
    $undergarment_count = $undergarment_count + $bra_count; // Add bra count to undergarments
}

$sock_count = ($laundry == "yes") ? ceil($days/2) : min($days, 7); // Cap at 7
/* Clothing base calculation */
$cloth_base = ($laundry == "yes") ? ceil($days / 2) : $days;

/* Build comprehensive packing list */
$packingItems = [];

/* ===== CLOTHING ===== */
$packingItems['👕 Clothing'] = [
    "Tops/Shirts ($cloth_base)",
    "Bottoms/Pants (".ceil($cloth_base/2).")",
    "$undergarment_count Undergarments",
    "Socks ($sock_count)",
    "Sleepwear"
];


/* Gender-specific essential clothing */
if($gender == "female"){
    if($budget_multiplier > 0.6) $packingItems['👕 Clothing'][] = "1-2 Casual Dresses";
} else if($gender == "male"){
    if($budget_multiplier > 0.6) $packingItems['👕 Clothing'][] = "Vest/Undershirt (2)";
}

/* Climate-specific clothing */
if($climate == "cold"){
    $packingItems['👕 Clothing'][] = "1 Warm Jacket";
    $packingItems['👕 Clothing'][] = "Thermal Wear/Base Layers";
    if($budget_multiplier > 0.6) $packingItems['👕 Clothing'][] = "Sweater";
    $packingItems['👕 Clothing'][] = "Warm Hat & Gloves";
} elseif($climate == "hot"){
    $packingItems['👕 Clothing'][] = "2-3 Lightweight Shirts";
    if($budget_multiplier > 0.6) $packingItems['👕 Clothing'][] = "Shorts";
    $packingItems['👕 Clothing'][] = "Sun Hat/Cap";
} else {
    $packingItems['👕 Clothing'][] = "Light Jacket";
}

/* Purpose-specific clothing */
if($purpose == "business"){
    if($gender == "female"){
        if($budget_multiplier > 0.6) $packingItems['👕 Clothing'][] = "1 Formal Dress/Blazer";
    } else {
        $packingItems['👕 Clothing'][] = "1 Formal Shirt";
        $packingItems['👕 Clothing'][] = "Formal Pants";
    }
}
if($purpose == "adventure"){
    $packingItems['👕 Clothing'][] = "1-2 Active/Sports Wear";
    $packingItems['👕 Clothing'][] = "Hiking Pants";
}
if($purpose == "religious" && $budget_multiplier > 0.6){
    if($gender == "female"){
        $packingItems['👕 Clothing'][] = "1 Modest Dress/Saree";
    } else {
        $packingItems['👕 Clothing'][] = "1 Traditional Kurta";
    }
}

/* ===== FOOTWEAR ===== */
$packingItems['👟 Footwear'] = [
    "Comfortable Walking Shoes",
    "Sandals/Flip Flops"
];

if($budget_multiplier > 0.6){
    if($gender == "female"){
        $packingItems['👟 Footwear'][] = "Casual Flats/Sneakers";
    } else {
        $packingItems['👟 Footwear'][] = "Casual Sneakers";
    }
}

if($purpose == "adventure") $packingItems['👟 Footwear'][] = "Hiking Boots";
if($climate == "cold") $packingItems['👟 Footwear'][] = "Winter Boots";
if($purpose == "business") $packingItems['👟 Footwear'][] = "Formal Shoes";

/* ===== TOILETRIES & PERSONAL CARE ===== */
$packingItems['🧴 Toiletries & Personal Care'] = [
    "Toothbrush & Toothpaste",
    "Soap/Body Wash",
    "Shampoo & Conditioner",
    "Deodorant",
    "Hairbrush/Comb",
    "Skincare Products (basic)"
];

/* Gender-specific toiletries */
if($gender == "female"){
    $packingItems['🧴 Toiletries & Personal Care'][] = "Face Wash";
    $packingItems['🧴 Toiletries & Personal Care'][] = "Feminine Hygiene Products";
    if($budget_multiplier > 0.6){
        $packingItems['🧴 Toiletries & Personal Care'][] = "Makeup & Remover (small)";
        $packingItems['🧴 Toiletries & Personal Care'][] = "Moisturizer";
    }
} else {
    $packingItems['🧴 Toiletries & Personal Care'][] = "Razor & Shaving Cream";
    if($budget_multiplier > 0.6) $packingItems['🧴 Toiletries & Personal Care'][] = "Face Wash";
}

if($laundry == "yes"){
    $packingItems['🧴 Toiletries & Personal Care'][] = "Laundry Detergent (small)";
}

if($rain == "high" || $rain == "medium"){
    $packingItems['🧴 Toiletries & Personal Care'][] = "Antiseptic/Disinfectant";
}

/* ===== ELECTRONICS & GADGETS ===== */
$packingItems['📱 Electronics'] = [
    "Mobile Phone & Charger",
    "Power Bank (10000 mAh)"
];

if($budget_multiplier > 0.85){
    $packingItems['📱 Electronics'][] = "Headphones/Earbuds";
}

if($budget_multiplier > 0.6){
    if($climate == "cold" || $climate == "hot"){
        $packingItems['📱 Electronics'][] = "Portable Fan/Hand Warmer";
    }
}

/* ===== DOCUMENTS & ESSENTIALS ===== */
$packingItems['📄 Documents'] = [
    "ID/Passport",
    "Travel Tickets/Bookings",
    "Credit/Debit Cards",
    "Cash (Local Currency)"
];

if($budget_multiplier > 0.6){
    $packingItems['📄 Documents'][] = "Travel Insurance Certificate";
    $packingItems['📄 Documents'][] = "Emergency Contact List";
}

/* ===== HEALTH & MEDICATIONS ===== */
$packingItems['💊 Health'] = [
    "Prescribed Medications",
    "Pain Reliever (Paracetamol)",
    "Antihistamine",
    "Bandages/First Aid Kit"
];

if($budget_multiplier > 0.6){
    $packingItems['💊 Health'][] = "Antiseptic Cream";
    $packingItems['💊 Health'][] = "Stomach Remedies";
}

if($gender == "female" && $budget_multiplier > 0.6){
    $packingItems['💊 Health'][] = "Period Pain Relief";
}

if($climate == "hot") $packingItems['💊 Health'][] = "Sunscreen (SPF 30+)";
if($climate == "cold") $packingItems['💊 Health'][] = "Lip Balm";
if($rain == "high") $packingItems['💊 Health'][] = "Anti-Diarrhea Medication";

/* ===== ACCESSORIES ===== */
$packingItems['👜 Accessories'] = [
    "Sunglasses",
    "Reusable Water Bottle",
    "Umbrella/Raincoat"
];

if($budget_multiplier > 0.6){
    $packingItems['👜 Accessories'][] = "Watch";
    if($gender == "female") $packingItems['👜 Accessories'][] = "Small Crossbody Bag";
}

if($budget_multiplier > 0.85 && $gender == "female"){
    $packingItems['👜 Accessories'][] = "Jewelry (minimal)";
}

$packingItems['👜 Accessories'][] = "Day Bag / Small Backpack";


if($rain == "high") $packingItems['👜 Accessories'][] = "Waterproof Bag Cover";

/* ===== MISCELLANEOUS ===== */
$packingItems['🎒 Miscellaneous'] = [
    "Travel Adapter/Converter",
    "Earplugs/Eye Mask",
    "Travel Pillow",
    "Zip Lock Bags"
];

if($budget_multiplier > 0.6){
    $packingItems['🎒 Miscellaneous'][] = "Pen & Notebook";
    $packingItems['🎒 Miscellaneous'][] = "Tissue Pack";
}

if($purpose == "leisure" && $budget_multiplier > 0.6) $packingItems['🎒 Miscellaneous'][] = "Map/Guide Book";
if($purpose == "adventure") $packingItems['🎒 Miscellaneous'][] = "Rope/Multi-tool";
if($climate == "cold" && $budget_multiplier > 0.6) $packingItems['🎒 Miscellaneous'][] = "Lip Balm";
if($budget_multiplier > 0.85 && $gender == "female") $packingItems['🎒 Miscellaneous'][] = "Perfume (small bottle)";

/* ===== INSERT ITEMS INTO DATABASE IF NOT ALREADY PRESENT ===== */
$stmt_check = $conn->prepare("SELECT COUNT(*) as count FROM smart_packing_items WHERE profile_id=?");
$stmt_check->bind_param("i", $profile['id']);
$stmt_check->execute();
$check_result = $stmt_check->get_result()->fetch_assoc();

if($check_result['count'] == 0){
    foreach($packingItems as $category => $categoryItems){

        foreach($categoryItems as $item){

            $quantity = 1;
            $is_packed = 0;
            $stmt_insert = $conn->prepare("INSERT INTO smart_packing_items (profile_id, category, item_name, quantity, is_packed) VALUES (?, ?, ?, ?, ?)");
            $stmt_insert->bind_param("issii", $profile['id'], $category, $item, $quantity, $is_packed);
            $stmt_insert->execute();
        }
    }
}
$items = [];
if ($profile) {
    $p_id = $profile['id'];
    $res_items = $conn->query("SELECT * FROM smart_packing_items WHERE profile_id=$p_id ORDER BY category");
    while ($row = $res_items->fetch_assoc()) {
        $items[$row['category']][] = $row;
    }
}
$totalItems = 0;
$checkedItems_count = 0;

foreach($items as $section => $categoryItems){
    foreach($categoryItems as $row){
        $totalItems++;
        if($row['is_packed']) $checkedItems_count++;
    }
}


$progress = $totalItems > 0 ? ($checkedItems_count / $totalItems) * 100 : 0;

?>

<div class="progress-bar">
    <div class="progress-fill" id="progressFill" style="width: <?= $progress ?>%"></div>
</div>

    <div class="summary">
    <div class="summary-item">
        <strong id="totalItems"><?= $totalItems ?></strong>
        <span>Total Items</span>
    </div>
    <div class="summary-item">
        <strong id="packedCount"><?= $checkedItems_count ?></strong>
        <span>Packed</span>
    </div>
    <div class="summary-item">
        <strong id="remainingCount"><?= $totalItems - $checkedItems_count ?></strong>
        <span>Remaining</span>
    </div>
    <div class="summary-item">
        <strong id="completePercent"><?= round($progress) ?>%</strong>
        <span>Complete</span>
    </div>
</div>

<?php foreach($items as $section => $categoryItems): ?>
    <div class="checklist-section">
        <h4><?= $section ?></h4>
        <div class="checklist-items">
            <?php foreach($categoryItems as $row):

                $isChecked = $row['is_packed'];

            ?>
                <div class="checklist-item" data-item="<?= htmlspecialchars($row['item_name']
) ?>">
                    <input type="checkbox" id="item_<?= md5($row['item_name']
) ?>" 
                        data-item="<?= htmlspecialchars($row['item_name']
) ?>"
                        onchange="updateCheckbox(this)" 
                        <?= $isChecked ? 'checked' : '' ?> 
                        style="width: 20px; height: 20px; cursor: pointer; accent-color: #667eea;">
                    <label for="item_<?= md5($row['item_name']) ?>" style="margin: 0; flex: 1; cursor: pointer; margin-left: 10px;"><?= htmlspecialchars($row['item_name']
) ?></label>
                    <button type="button" class="remove-btn" onclick="removeItem(this)" title="Remove item">×</button>
                </div>
            <?php endforeach; ?>
        </div>
    </div>
<?php endforeach; ?>

</div>

<?php } ?>

</div>

<script>
function updateCheckbox(checkbox) {
    const itemName = checkbox.getAttribute('data-item');
    const isChecked = checkbox.checked ? 1 : 0;
    const label = checkbox.nextElementSibling;
    
    // Update visual styling immediately
    if(checkbox.checked) {
        label.style.textDecoration = 'line-through';
        label.style.color = '#667eea';
        label.style.opacity = '0.7';
    } else {
        label.style.textDecoration = 'none';
        label.style.color = 'inherit';
        label.style.opacity = '1';
    }
    
    // Update the summary counters
    updateSummary();
    
    // Send AJAX request to update database
    const formData = new FormData();
    formData.append('update_checklist', '1');
    formData.append('item_id', itemName);
    formData.append('is_checked', isChecked);
    
    fetch('smart.php', {
        method: 'POST',
        body: formData
    })
    .then(response => {
        if(response.ok) {
            return response.json();
        }
        throw new Error('Network response was not ok');
    })
    .then(data => {
        console.log('Updated:', data);
    })
    .catch(error => console.error('Error updating item:', error));
}

function updateSummary() {
    const allCheckboxes = document.querySelectorAll('.checklist-item input[type="checkbox"]');
    const totalItems = allCheckboxes.length;
    let packedCount = 0;
    
    // Count checked items
    allCheckboxes.forEach(checkbox => {
        if(checkbox.checked) packedCount++;
    });
    
    const remainingCount = totalItems - packedCount;
    const completePercent = totalItems > 0 ? Math.round((packedCount / totalItems) * 100) : 0;
    
    // Update the DOM elements
    const totalEl = document.getElementById('totalItems');
    if(totalEl) totalEl.textContent = totalItems;
    document.getElementById('packedCount').textContent = packedCount;
    document.getElementById('remainingCount').textContent = remainingCount;
    document.getElementById('completePercent').textContent = completePercent + '%';
    
    // Update progress bar
    const progressFill = document.getElementById('progressFill');
    if(progressFill) {
        progressFill.style.width = completePercent + '%';
    }
}

// Apply visual styling on page load for already checked items
document.addEventListener('DOMContentLoaded', function() {
    const checkboxes = document.querySelectorAll('.checklist-item input[type="checkbox"]');
    checkboxes.forEach(checkbox => {
        const label = checkbox.nextElementSibling;
        if(label && checkbox.checked) {
            label.style.textDecoration = 'line-through';
            label.style.color = '#667eea';
            label.style.opacity = '0.7';
        }
    });
    // Hook up custom UI
    const toggle = document.getElementById('addCustomToggle');
    const form = document.getElementById('customForm');
    const addBtn = document.getElementById('addCustomBtn');
    if(toggle && form){
        toggle.addEventListener('click', () => { form.style.display = form.style.display === 'none' ? 'block' : 'none'; });
    }
    if(addBtn){
        addBtn.addEventListener('click', addCustomItem);
    }
});

function removeItem(btn){
    const itemDiv = btn.closest('.checklist-item');
    if(!itemDiv) return;
    const itemName = itemDiv.getAttribute('data-item');
    if(!confirm('Remove "' + itemName + '" from checklist?')) return;

    const fd = new FormData();
    fd.append('remove_item', '1');
    fd.append('item_name', itemName);

    fetch('smart.php', { method: 'POST', body: fd })
    .then(r=>r.json())
    .then(data => {
        if(data.success){
            itemDiv.remove();
            updateSummary();
        }
    }).catch(err=>console.error(err));
}

function addCustomItem(){
    // Respect user-specified category; default to Clothing when empty
    const rawCategory = document.getElementById('customCategory').value.trim();
    const category = rawCategory || '👕 Clothing';
    const item = document.getElementById('customItem').value.trim();
    const quantity = parseInt(document.getElementById('customQuantity').value) || 1;
    if(!item){ alert('Enter an item name'); return; }

    const fd = new FormData();
    fd.append('add_custom_item', '1');
    fd.append('category', category);
    fd.append('item_name', item);
    fd.append('quantity', quantity);

    fetch('smart.php', { method: 'POST', body: fd })
    .then(r=>r.json())
    .then(data => {
        if(data.success){
            // find section matching the chosen category
            const sections = document.querySelectorAll('.checklist-section');
            let target = null;
            sections.forEach(sec => {
                const h4 = sec.querySelector('h4');
                if(h4 && h4.textContent.trim() === category) target = sec;
            });
            if(!target){
                // create a new section for this category and append it at the end
                const container = document.createElement('div'); container.className='checklist-section';
                const h4 = document.createElement('h4'); h4.textContent = category;
                const itemsWrap = document.createElement('div'); itemsWrap.className='checklist-items';
                container.appendChild(h4); container.appendChild(itemsWrap);
                const existing = document.querySelectorAll('.checklist-section');
                if(existing.length > 0){
                    existing[existing.length-1].insertAdjacentElement('afterend', container);
                } else {
                    // fallback: append to card
                    const card = document.querySelector('.card');
                    card.appendChild(container);
                }
                target = container;
            }
            const itemsWrap = target.querySelector('.checklist-items');
            const id = 'item_' + Math.random().toString(36).substr(2,9);
            const div = document.createElement('div'); div.className='checklist-item'; div.setAttribute('data-item', data.item);
            const input = document.createElement('input'); input.type='checkbox'; input.id=id; input.setAttribute('data-item', data.item); input.style.width='20px'; input.style.height='20px'; input.onchange = function(){ updateCheckbox(this); };
            const label = document.createElement('label'); label.setAttribute('for', id); label.style.margin='0'; label.style.flex='1'; label.style.cursor='pointer'; label.style.marginLeft='10px'; label.textContent = data.item + (data.quantity && data.quantity>1 ? ' ('+data.quantity+')' : '');
            const rem = document.createElement('button'); rem.type='button'; rem.className='remove-btn'; rem.textContent='×'; rem.onclick = function(){ removeItem(this); };
            div.appendChild(input); div.appendChild(label); div.appendChild(rem);
            itemsWrap.appendChild(div);
            updateSummary();
            // hide form and clear
            document.getElementById('customForm').style.display='none';
            document.getElementById('customItem').value='';
        }
    }).catch(err=>console.error(err));
}

</script>

</body>
</html>
