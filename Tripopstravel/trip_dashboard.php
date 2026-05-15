<?php
session_start();
$conn = new mysqli("localhost","root","","tripops_db");
if ($conn->connect_error) die("DB Error");
$user_id = $_SESSION['user_id'] ?? 1;
/* =========================================
   TERMINATE TRIP
========================================= */
if(isset($_POST['terminate_trip'])) {
    if(isset($_SESSION['created_trip_id'])){
        $trip_id = $_SESSION['created_trip_id'];
        // Get destination for redirect
        $stmt = $conn->prepare("SELECT destination_slug FROM trips WHERE id=?");
        $stmt->bind_param("i", $trip_id);
        $stmt->execute();
        $trip_data = $stmt->get_result()->fetch_assoc();
        $destination_slug = $trip_data['destination_slug'] ?? '';
        // Finish trip
        $stmt2 = $conn->prepare("UPDATE trips SET status='finished' WHERE id=?");
        $stmt2->bind_param("i", $trip_id);
        $stmt2->execute();
    } else {
        $destination_slug = $_SESSION['selected_destination'] ?? '';
    }
    // Clear sessions
    unset($_SESSION['created_trip_id'], $_SESSION['trip_type'], $_SESSION['group_role'], $_SESSION['invite_code']);
    // Redirect
    if (!empty($destination_slug)) {
        header("Location: destination_details.php?place=" . urlencode($destination_slug));
    } else {
        header("Location: destination.php");
    }
    exit();
}
/* =========================================
   BACK BUTTON HANDLER
========================================= */
if(isset($_POST['back_from_trip_type'])){
    unset($_SESSION['trip_type'], $_SESSION['group_role']);
    header("Location: destination.php");
    exit();
}
/* =========================================
   AUTO RESTORE ACTIVE TRIP
========================================= */
if(!isset($_SESSION['created_trip_id'])) {
    $stmt = $conn->prepare("
        SELECT t.id, t.trip_type, t.destination_slug
        FROM trips t
        LEFT JOIN trip_members tm ON t.id = tm.trip_id
        WHERE (t.host_id = ? OR tm.user_id = ?) AND t.status = 'active'
        LIMIT 1
    ");
    $stmt->bind_param("ii", $user_id, $user_id);
    $stmt->execute();
    $result = $stmt->get_result();

    if($result->num_rows > 0){
        $trip = $result->fetch_assoc();
        $_SESSION['created_trip_id'] = $trip['id'];
        $_SESSION['trip_type'] = $trip['trip_type'];
        $_SESSION['selected_destination'] = $trip['destination_slug'];

        if($trip['trip_type'] === "group"){
            $checkHost = $conn->prepare("SELECT host_id FROM trips WHERE id=?");
            $checkHost->bind_param("i", $trip['id']);
            $checkHost->execute();
            $hostData = $checkHost->get_result()->fetch_assoc();
            $_SESSION['group_role'] = ($hostData['host_id'] == $user_id) ? "host" : "member";
        }
    }
}
/* =========================================
   CREATE TRIP
========================================= */
if(isset($_POST['create_trip'])) {
    $destination = $_POST['destination'];
    $trip_type = $_SESSION['trip_type'] ?? 'solo';
    $invite_code = ($trip_type === "group") ? strtoupper(substr(md5(time()),0,6)) : null;

    $title = $_POST['title'];
    $traveller_type = $_POST['traveller_type'];
    $start_date = $_POST['start_date'];
    $end_date = $_POST['end_date'];

    $stmt = $conn->prepare("
        INSERT INTO trips 
        (host_id, destination_slug, title, traveller_type, trip_type, invite_code, start_date, end_date, created_at, status)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, NOW(), 'active')
    ");
    $stmt->bind_param("isssssss", 
        $user_id, $destination, $title, $traveller_type, $trip_type, $invite_code, $start_date, $end_date
    );
    $stmt->execute();
    $trip_id = $stmt->insert_id;

    // Add creator as group host
    if($trip_type === "group") {
        $role = "host";
        $stmt2 = $conn->prepare("INSERT INTO trip_members (trip_id,user_id,role) VALUES (?,?,?)");
        $stmt2->bind_param("iis", $trip_id, $user_id, $role);
        $stmt2->execute();
    }

    $_SESSION['created_trip_id'] = $trip_id;
    $_SESSION['invite_code'] = $invite_code;
    $_SESSION['selected_destination'] = $destination;

    header("Location: trip_dashboard.php");
    exit();
}
/* =========================================
   JOIN TRIP
========================================= */
if(isset($_POST['join_trip'])) {
    $code = $_POST['invite_code'];
    $stmt = $conn->prepare("SELECT id FROM trips WHERE invite_code=? AND status='active'");
    $stmt->bind_param("s", $code);
    $stmt->execute();
    $result = $stmt->get_result();
    if($result->num_rows > 0) {
        $trip = $result->fetch_assoc();
        $trip_id = $trip['id'];
        $check = $conn->prepare("SELECT id FROM trip_members WHERE trip_id=? AND user_id=?");
        $check->bind_param("ii", $trip_id, $user_id);
        $check->execute();

        if(!$check->get_result()->fetch_assoc()){
            $role = "member";
            $stmt2 = $conn->prepare("INSERT INTO trip_members (trip_id,user_id,role) VALUES (?,?,?)");
            $stmt2->bind_param("iis", $trip_id, $user_id, $role);
            $stmt2->execute();
        }

        $_SESSION['created_trip_id'] = $trip_id;
        $_SESSION['trip_type'] = "group";
        header("Location: trip_dashboard.php");
        exit();
    } else { 
        $join_error = "Invalid Code"; 
    }
}
/* =========================================
   SEND TRIP MESSAGE
========================================= */
if(isset($_POST['send_message']) && isset($_SESSION['created_trip_id'])) {
    $trip_id = $_SESSION['created_trip_id'];
    $message = $_POST['new_message'];

    $stmt = $conn->prepare("INSERT INTO trip_messages (trip_id,user_id,message) VALUES (?,?,?)");
    $stmt->bind_param("iis", $trip_id, $user_id, $message);
    $stmt->execute();

    header("Location: ".$_SERVER['PHP_SELF']);
    exit();
}
/* =========================================
   CAPTURE DESTINATION
========================================= */
if(isset($_GET['place']) && !isset($_SESSION['created_trip_id'])){
    $_SESSION['selected_destination'] = $_GET['place'];
    header("Location: trip_dashboard.php");
    exit();
}
/* =========================================
   STEP HANDLERS
========================================= */
if(isset($_POST['select_trip_type'])) { $_SESSION['trip_type'] = $_POST['trip_type']; }
if(isset($_POST['select_group_role'])) { $_SESSION['group_role'] = $_POST['group_role']; }
if(isset($_POST['update_budget']) 
   && isset($_SESSION['created_trip_id']) 
   && $_SESSION['group_role'] === 'host'
){
    $trip_id = $_SESSION['created_trip_id'];

    // Prevent update if anyone has paid
    $pay_check = $conn->query("SELECT id FROM trip_payments WHERE trip_id=$trip_id AND status='verified'");
    if($pay_check->num_rows > 0){
        // Someone has paid → do not update
        $_SESSION['budget_error'] = "Cannot update budget after payments have started.";
    } else {
        $total_cost = floatval($_POST['total_estimated_cost']);

        $stmt = $conn->prepare("SELECT id FROM trip_budget WHERE trip_id=?");
        $stmt->bind_param("i", $trip_id);
        $stmt->execute();
        $res = $stmt->get_result();

        if($res->num_rows > 0){
            $stmt2 = $conn->prepare("UPDATE trip_budget SET total_cost=? WHERE trip_id=?");
            $stmt2->bind_param("di", $total_cost, $trip_id);
            $stmt2->execute();
        } else {
            $stmt2 = $conn->prepare("INSERT INTO trip_budget (trip_id,total_cost) VALUES (?,?)");
            $stmt2->bind_param("id", $trip_id, $total_cost);
            $stmt2->execute();
        }
    }

    header("Location: trip_dashboard.php");
    exit();
}

/* =========================================
   PROCESS FAKE PAYMENT
========================================= */
if(isset($_POST['process_fake_payment']) && isset($_SESSION['created_trip_id'])){
    $trip_id = $_SESSION['created_trip_id'];

    // Check if user already paid
    $check = $conn->prepare("SELECT id FROM trip_payments WHERE trip_id=? AND user_id=? AND status='verified'");
    $check->bind_param("ii", $trip_id, $user_id);
    $check->execute();

    if(!$check->get_result()->fetch_assoc()){
        // Insert verified payment
        $stmt = $conn->prepare("INSERT INTO trip_payments (trip_id,user_id,status,paid_at) VALUES (?, ?, 'verified', NOW())");
        $stmt->bind_param("ii", $trip_id, $user_id);
        $stmt->execute();
    }

    // Reload page to update status
    header("Location: trip_dashboard.php");
    exit();
}
/* =========================================
   CREATE TRIP VALIDATION (10-DAY LIMIT)
========================================= */
if(isset($_POST['create_trip'])){
    $start_date = $_POST['start_date'];
    $end_date = $_POST['end_date'];
    $today = date('Y-m-d');
    
    // Changing to +9 days makes the total window (including today) exactly 10 days
    $max_allowed = date('Y-m-d', strtotime('+9 days')); 

    if($start_date < $today){
        die("Error: Start date cannot be in the past.");
    }

    if($start_date > $max_allowed || $end_date > $max_allowed) {
        die("Error: Selected dates exceed the 10-day booking window.");
    }

    if($end_date < $start_date) {
        die("Error: End date cannot be before start date.");
    }
}
require 'trip_view.php';
?>
