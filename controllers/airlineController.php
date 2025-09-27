<?php
require_once('../models/airline.php');

$airline = new Airline();

// Save airline
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $id = $_POST['id'] ?? 0;
    $name = $_POST['airline_name'] ?? '';
    $logo = $_POST['logo'] ?? '';

    $result = $airline->saveairline($id, $name, $logo);
    echo json_encode($result);
}

// Get all airlines
if (isset($_GET['action']) && $_GET['action'] === 'list') {
    echo $airline->getairlines();
}

// Get single airline details
if (isset($_GET['action']) && $_GET['action'] === 'details' && isset($_GET['id'])) {
    echo $airline->getairlinedetails($_GET['id']);
}

// Delete airline
if (isset($_GET['action']) && $_GET['action'] === 'delete' && isset($_GET['id'])) {
    echo json_encode($airline->deleteairline($_GET['id']));
}
?>
