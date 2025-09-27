<?php
require_once('../models/bookingclass.php');

$bookingClass = new BookingClass();

// Save booking class
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $id = $_POST['id'] ?? 0;
    $flight_id = $_POST['flight_id'] ?? 0;
    $type_name = $_POST['type_name'] ?? '';

    $result = $bookingClass->savebookingclass($id, $flight_id, $type_name);
    echo json_encode($result);
}

// Get all booking classes
if (isset($_GET['action']) && $_GET['action'] === 'list') {
    echo $bookingClass->getbookingclasses();
}

// Get single booking class details
if (isset($_GET['action']) && $_GET['action'] === 'details' && isset($_GET['id'])) {
    echo $bookingClass->getbookingclassdetails($_GET['id']);
}

// Delete booking class
if (isset($_GET['action']) && $_GET['action'] === 'delete' && isset($_GET['id'])) {
    echo json_encode($bookingClass->deletebookingclass($_GET['id']));
}
?>
