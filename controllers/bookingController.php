<?php
require_once('../models/booking.php');

$booking = new Booking();

// Save booking
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $id = $_POST['id'] ?? 0;
    $booking_type_id = $_POST['booking_type_id'] ?? 0;
    $flight_id = $_POST['flight_id'] ?? 0;
    $booking_date = $_POST['booking_date'] ?? '';
    $payment_method = $_POST['payment_method'] ?? '';

    $result = $booking->savebooking($id, $booking_type_id, $flight_id, $booking_date, $payment_method);
    echo json_encode($result);
}

// Get all bookings
if (isset($_GET['action']) && $_GET['action'] === 'list') {
    echo $booking->getbookings();
}

// Get single booking details
if (isset($_GET['action']) && $_GET['action'] === 'details' && isset($_GET['id'])) {
    echo $booking->getbookingdetails($_GET['id']);
}

// Delete booking
if (isset($_GET['action']) && $_GET['action'] === 'delete' && isset($_GET['id'])) {
    echo json_encode($booking->deletebooking($_GET['id']));
}
?>
