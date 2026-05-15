<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Trip Dashboard | TravelApp</title>
    <link rel="stylesheet" href="dashboard.css">
</head>
<body>
   

<div class="container">
    <h2>Trip Dashboard</h2>

    <?php if(!isset($_SESSION['trip_type'])): ?>
    <div class="step-card">
        <h3>Select Trip Type</h3>
        <form method="POST">
            <input type="radio" name="trip_type" value="solo" id="solo" required> <label for="solo">Solo Trip</label><br>
            <input type="radio" name="trip_type" value="group" id="group" required> <label for="group">Group Trip</label><br><br>
            <button type="submit" name="select_trip_type">Continue</button>
             <form method="POST">
    <button type="submit" name="terminate_trip" class="btn-terminate">
        <i class="fas fa-times"></i> Terminate & Exit
        </form>

    </div>

    <?php elseif($_SESSION['trip_type']==="group" && !isset($_SESSION['group_role']) && !isset($_SESSION['created_trip_id'])): ?>
    <div class="step-card">
        <h3>Are You Host or Member?</h3>
        <form method="POST">
            <input type="radio" name="group_role" value="host" id="host" required> <label for="host">Host</label><br>
            <input type="radio" name="group_role" value="member" id="member" required> <label for="member">Member</label><br><br>
            <button type="submit" name="select_group_role">Continue</button>
            <form method="POST">
    <button type="submit" name="terminate_trip" class="btn-terminate">
        <i class="fas fa-times"></i> Terminate & Exit
    </button>
</form>
        </form>

    </div>

    <?php 
    /* --- UNIFIED DASHBOARD VIEW (HOST & MEMBER) --- */
    elseif(isset($_SESSION['created_trip_id'])): 
        $trip_id = $_SESSION['created_trip_id'];
        
        // Fetch Trip Data
        $stmt = $conn->prepare("SELECT * FROM trips WHERE id=?");
        $stmt->bind_param("i", $trip_id); $stmt->execute();
        $trip_row = $stmt->get_result()->fetch_assoc();

        // Fetch Members
        $members = [];
        $stmt2 = $conn->prepare("SELECT u.id as uid, u.name, tm.role FROM trip_members tm JOIN users u ON tm.user_id = u.id WHERE tm.trip_id = ?");
        $stmt2->bind_param("i", $trip_id); $stmt2->execute();
        $res2 = $stmt2->get_result();
        while($row = $res2->fetch_assoc()){ $members[] = $row; }

        // Determine Trip Status
        $start = new DateTime($trip_row['start_date']);
        $end = new DateTime($trip_row['end_date']);
        $now = new DateTime();
        $now->setTime(0,0,0); 

        if ($now >= $start && $now <= $end) { $status_label = "Ongoing"; $status_class = "ongoing"; }
        elseif ($now > $end) { $status_label = "Finished"; $status_class = "finished"; }
        else { $status_label = "Upcoming"; $status_class = "upcoming"; }
    ?>

        <div class="trip-hero">
            <div class="hero-content">
                <div class="status-pill <?= $status_class ?>"><?= $status_label ?></div>
                <h1 class="trip-title"><?= htmlspecialchars($trip_row['title']) ?></h1>
                <div class="trip-details">
                    <span>📍 <?= htmlspecialchars($trip_row['destination_slug']) ?></span>
                    <span class="sep">•</span>
                    <span>📅 <?= date("M j", strtotime($trip_row['start_date'])) ?> - <?= date("M j, Y", strtotime($trip_row['end_date'])) ?></span>
                </div>
            </div>
        </div>

        <?php if($_SESSION['trip_type']==="group"): ?>
            <p><strong>Invite Code:</strong> <code style="background:#eee; padding:5px;"><?= $trip_row['invite_code'] ?></code></p>
            
            <?php
                // Budget Logic
                $b_res = $conn->query("SELECT total_cost FROM trip_budget WHERE trip_id = $trip_id");
                $total_val = ($b_res->num_rows > 0) ? $b_res->fetch_assoc()['total_cost'] : 0;
                $split_val = (count($members) > 0) ? $total_val / count($members) : 0;
                
                $p_check = $conn->query("SELECT status FROM trip_payments WHERE trip_id = $trip_id AND user_id = $user_id AND status = 'verified'");
                $my_status = ($p_check->num_rows > 0) ? 'verified' : 'unpaid';

                $pay_exists = $conn->query("SELECT id FROM trip_payments WHERE trip_id = $trip_id AND status = 'verified'");
                $is_locked = ($pay_exists->num_rows > 0);
            ?>

            <div class="budget-box <?= $is_locked ? 'budget-box-locked' : '' ?>">
                <div>
                    <h4>Financials</h4>
                   <form method="POST" class="financials-form">
    <input type="number" name="total_estimated_cost" value="<?= $total_val ?>" 
           class="budget-input" <?= ($_SESSION['group_role'] !== 'host') ? 'readonly' : '' ?>>

    <?php if($_SESSION['group_role'] === 'host'): ?>
        <button type="submit" name="update_budget" 
        <?= $is_locked ? 'disabled title="Cannot update after payments"' : '' ?>>
    Update
</button>

    <?php endif; ?>
</form>

                    <p class="split-info">Your Split: <strong>$<?= number_format($split_val, 2) ?></strong></p>
                </div>

                <div id="payment-zone">
                    <?php if($my_status !== 'verified'): ?>
                        <button type="button" onclick="openPayModal()">Pay My Share</button>
                    <?php else: ?>
                        <div class="payment-zone-verified"><span class="verified-badge">Paid</span></div>
                    <?php endif; ?>
                </div>
            </div>

            <div class="group-wrapper">
                <div class="members-sidebar">
                    <div class="sidebar-header">
                        <h4>Travelers</h4>
                        <span class="member-count"><?= count($members) ?> total</span>
                    </div>
                    <div class="members-stack">
                        <?php foreach($members as $m): 
                            $pay_st = $conn->query("SELECT status FROM trip_payments WHERE trip_id=$trip_id AND user_id=".$m['uid']." AND status='verified'");
                            $is_paid = ($pay_st->num_rows > 0);
                            $initials = strtoupper(substr($m['name'], 0, 1));
                        ?>
                            <div class="member-card <?= $is_paid ? 'paid' : 'pending' ?>">
                                <div class="avatar-circle"><?= $initials ?></div>
                                <div class="member-info">
                                    <span class="member-name"><?= htmlspecialchars($m['name']) ?> <?php if($m['role']==="host"): ?>👑<?php endif; ?></span>
                                    <span class="member-status"><?= $is_paid ? 'Paid' : 'Awaiting' ?></span>
                                </div>
                                <div class="status-indicator"></div>
                            </div>
                        <?php endforeach; ?>
                    </div>
                </div>

                <div class="chat-interface">
                    <div class="chat-header"><div class="chat-title">Group Chat</div><div class="online-dot"></div></div>
                    <div class="chat-body" id="chatBox">
                        <?php
                        $messages = $conn->prepare("SELECT tm.message, u.name, tm.user_id FROM trip_messages tm JOIN users u ON tm.user_id = u.id WHERE tm.trip_id=? ORDER BY tm.created_at ASC");
                        $messages->bind_param("i", $trip_id); $messages->execute(); $res = $messages->get_result();
                        while($msg = $res->fetch_assoc()):
                            $is_me = ($msg['user_id'] == $user_id);
                        ?>
                            <div class="message-row <?= $is_me ? 'me' : 'them' ?>">
                                <div class="msg-bubble">
                                    <?php if(!$is_me): ?><div class="msg-author"><?= htmlspecialchars($msg['name']) ?></div><?php endif; ?>
                                    <div class="msg-text"><?= htmlspecialchars($msg['message']) ?></div>
                                </div>
                            </div>
                        <?php endwhile; ?>
                    </div>
                    <form method="POST" class="chat-input-area">
                        <input type="text" name="new_message" placeholder="Message..." required autocomplete="off">
                        <button type="submit" name="send_message">Send</button>
                    </form>
                </div>
            </div>
        <?php endif; ?>

        <div class="action-bar">
            <button onclick="location.href='itinerary.php'">Itinerary</button>
            <button onclick="location.href='smart.php'" style="background:var(--accent-blue);">Packing Assistant</button>
            <?php if($_SESSION['trip_type'] === 'solo' || $_SESSION['group_role'] === 'host' ): ?>
            <form method="POST" style="margin:0;"><button type="submit" name="terminate_trip">End Trip</button></form>
            <?php endif; ?>
        </div>

    <?php 
    /* --- CREATE TRIP FORM (FOR HOSTS) --- */
    elseif(($_SESSION['trip_type']==="solo") || ($_SESSION['trip_type']==="group" && isset($_SESSION['group_role']) && $_SESSION['group_role']==="host")): 
        $destination = $_SESSION['selected_destination'] ?? '';
    ?>
        <form method="POST">
            <h3>Create Your Journey</h3>
            <input type="hidden" name="destination" value="<?= htmlspecialchars($destination) ?>">
            <p>Destination: <strong><?= htmlspecialchars($destination) ?></strong></p>
            <label>Trip Title</label><input type="text" name="title" required>
            <?php
$today = date('Y-m-d');
$max_start = date('Y-m-d', strtotime('+10 days'));
?>
<?php
    $today = date('Y-m-d');
    $max_date = date('Y-m-d', strtotime('+10 days'));
?>
<?php
    // Ensure the timezone matches your location to prevent "yesterday" from being available
    date_default_timezone_set('Asia/Kolkata'); // Set this to your specific timezone
    $today = date('Y-m-d');
    $max_limit = date('Y-m-d', strtotime('+10 days'));
?>

<?php

    $today = date('Y-m-d');
?>
<div style="display:flex; gap:10px;">
    <div>
        <label>Start Date</label><br>
        <input type="date" name="start_date" required
               min="<?= $today ?>" 
               onchange="setEndMinMax()"
               id="start_date">
    </div>

    <div>
        <label>End Date</label><br>
        <input type="date" name="end_date" required
               min="<?= $today ?>"
               id="end_date">
    </div>
</div>
            <button type="submit" name="create_trip" style="margin-top:15px;">Launch Trip</button>
            <form method="POST">
    <button type="submit" name="terminate_trip" class="btn-terminate">
        <i class="fas fa-times"></i> Terminate & Exit
    </button>
</form>
        </form>


    <?php 
    /* --- JOIN TRIP FORM (FOR MEMBERS) --- */
    elseif(isset($_SESSION['group_role']) && $_SESSION['group_role']==="member"): ?>
        <div class="step-card">
            <h3>Join a Group</h3>
            <form method="POST">
                <input type="text" name="invite_code" placeholder="6-digit code" required>
                <button type="submit" name="join_trip">Join Trip</button>
                <form method="POST">
    <button type="submit" name="terminate_trip" class="btn-terminate">
        <i class="fas fa-times"></i> Terminate & Exit
    </button>
</form>
            </form>
            <?php if(isset($join_error)): ?><p class="error-msg"><?= $join_error ?></p><?php endif; ?>
        </div>

    <?php endif; ?>
</div>

<div id="cardModal" class="modal-overlay">
    <div class="modal-content-card">
        <div id="modal-content">
            <h3>Card Details</h3>
            <p id="payment-error" style="color: var(--error-red); font-size: 12px; display: none; margin-bottom: 10px;"></p>

            <input type="text" id="card_no" placeholder="16 Digit Card No" maxlength="16" class="input-card-no" oninput="this.value = this.value.replace(/[^0-9]/g, '')">
            
            <div class="expiry-cvv-row">
                <input type="text" id="expiry" placeholder="MM/YY" maxlength="5" class="input-half" oninput="formatExpiry(this)">
                <input type="password" id="cvv" placeholder="CVV" maxlength="3" class="input-half" oninput="this.value = this.value.replace(/[^0-9]/g, '')">
            </div>
            
            <button type="button" onclick="validateAndPay()" class="btn-confirm-pay">Confirm Payment</button>
            <p onclick="closePayModal()" class="cancel-text">Cancel</p>
        </div>

        <div id="modal-loader" style="display:none;" class="loader-container">
            <div class="loader loader-center"></div>
            <p>Verifying with Bank...</p>
        </div>
    </div>
</div>

<form id="pay-form-actual" method="POST" style="display:none;"><input type="hidden" name="process_fake_payment" value="1"></form>

<script>
function openPayModal() { document.getElementById('cardModal').style.display = 'flex'; }
function closePayModal() { document.getElementById('cardModal').style.display = 'none'; }
function startLoading() {
    document.getElementById('modal-content').style.display = 'none';
    document.getElementById('modal-loader').style.display = 'block';
    setTimeout(() => { document.getElementById('pay-form-actual').submit(); }, 2000);
}
const chatBox = document.getElementById('chatBox');
if(chatBox) chatBox.scrollTop = chatBox.scrollHeight;
// Helper to format MM/YY automatically
function formatExpiry(input) {
    let code = input.value.replace(/\D/g, '').substring(0, 4);
    if (code.length > 2) {
        input.value = code.substring(0, 2) + '/' + code.substring(2, 4);
    } else {
        input.value = code;
    }
}

function validateAndPay() {
    const cardNo = document.getElementById('card_no').value;
    const expiry = document.getElementById('expiry').value;
    const cvv = document.getElementById('cvv').value;
    const errorEl = document.getElementById('payment-error');

    // 1. Check Card Number (16 digits)
    if (!/^\d{16}$/.test(cardNo)) {
        showError("Please enter a valid 16-digit card number.");
        return;
    }

    // 2. Check Expiry Format (MM/YY)
    if (!/^(0[1-9]|1[0-2])\/\d{2}$/.test(expiry)) {
        showError("Expiry must be in MM/YY format.");
        return;
    }

    // 3. Check if card is expired
    const [month, year] = expiry.split('/').map(n => parseInt(n));
    const now = new Date();
    const currentYear = parseInt(now.getFullYear().toString().slice(-2));
    const currentMonth = now.getMonth() + 1;

    if (year < currentYear || (year === currentYear && month < currentMonth)) {
        showError("This card has expired.");
        return;
    }

    // 4. Check CVV (3 digits)
    if (!/^\d{3}$/.test(cvv)) {
        showError("Enter a valid 3-digit CVV.");
        return;
    }

    // If all valid, proceed to loading
    errorEl.style.display = 'none';
    startLoading();
}

function showError(msg) {
    const errorEl = document.getElementById('payment-error');
    errorEl.textContent = msg;
    errorEl.style.display = 'block';
}

function startLoading() {
    document.getElementById('modal-content').style.display = 'none';
    document.getElementById('modal-loader').style.display = 'block';
    // Simulate bank processing time
    setTimeout(() => {
        document.getElementById('pay-form-actual').submit();
    }, 2500);
}

function openPayModal() { 
    document.getElementById('cardModal').style.display = 'flex'; 
}

function closePayModal() { 
    document.getElementById('cardModal').style.display = 'none'; 
    document.getElementById('payment-error').style.display = 'none';
}

function setEndMinMax() {
    const startInput = document.getElementById('start_date');
    const endInput = document.getElementById('end_date');
    
    if(!startInput.value) return;

    // 1. Set the minimum end date to the start date (cannot end before you start)
    endInput.min = startInput.value;

    // 2. Calculate the Max Date (Start Date + 9 days = 10 days total)
    const startDate = new Date(startInput.value);
    const maxDate = new Date(startDate);
    maxDate.setDate(startDate.getDate() + 9); 

    // 3. Format to YYYY-MM-DD for the input attribute
    const yyyy = maxDate.getFullYear();
    const mm = String(maxDate.getMonth() + 1).padStart(2, '0');
    const dd = String(maxDate.getDate()).padStart(2, '0');
    const maxStr = `${yyyy}-${mm}-${dd}`;

    // 4. Apply the limit to the end date picker
    endInput.max = maxStr;

    // 5. Validation: If the current end date is now outside the new range, reset it
    if(endInput.value > maxStr) {
        endInput.value = maxStr;
    }
    if(endInput.value < startInput.value) {
        endInput.value = startInput.value;
    }
}
// Validate dates on form submit
document.getElementById('createTripForm').addEventListener('submit', function(e){
    const startInput = document.querySelector('input[name="start_date"]');
    const endInput = document.querySelector('input[name="end_date"]');
    const today = new Date();
    today.setHours(0,0,0,0); // normalize

    const startDate = new Date(startInput.value);
    const endDate = new Date(endInput.value);

    // 1️⃣ Start date cannot be before today
    if(startDate < today){
        alert("Start date cannot be before today.");
        e.preventDefault();
        return;
    }

    // 2️⃣ End date cannot be before start date
    if(endDate < startDate){
        alert("End date cannot be before start date.");
        e.preventDefault();
        return;
    }

    // 3️⃣ Trip duration max 10 days
    const diffDays = (endDate - startDate)/(1000*60*60*24) + 1; // inclusive
    if(diffDays > 10){
        alert("Trip duration cannot exceed 10 days.");
        e.preventDefault();
        return;
    }
});


</script>

</body>
</html>