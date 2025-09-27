<?php
require_once('../models/bookingsupply.php');

$bookingSupply = new BookingSupply();

// Save booking supply
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $id = $_POST['id'] ?? 0;
    $flight_id = $_POST['flight_id'] ?? 0;
    $booking_class_id = $_POST['booking_class_id'] ?? 0;
    $seats = $_POST['number_of_seats'] ?? 0;
    $price = $_POST['price'] ?? 0.0;
    $currency = $_POST['currency'] ?? '';

    $result = $bookingSupply->savebookingsupply($id, $flight_id, $booking_class_id, $seats, $price, $currency);
    echo json_encode($result);
}

// Get all booking supplies
if (isset($_GET['action']) && $_GET['action'] === 'list') {
    echo $bookingSupply->getbookingsupplies();
}

// Get single booking supply details
if (isset($_GET['action']) && $_GET['action'] === 'details' && isset($_GET['id'])) {
    echo $bookingSupply->getbookingsupplydetails($_GET['id']);
}

// Delete booking supply
if (isset($_GET['action']) && $_GET['action'] === 'delete' && isset($_GET['id'])) {
    echo json_encode($bookingSupply->deletebookingsupply($_GET['id']));
}
?>
