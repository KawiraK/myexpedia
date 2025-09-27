<?php
require_once('../models/airport.php');

$airport = new Airport();

// Save airport
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $id = $_POST['id'] ?? 0;
    $code = $_POST['code'] ?? '';
    $city_id = $_POST['city_id'] ?? 0;

    $result = $airport->saveairport($id, $code, $city_id);
    echo json_encode($result);
}

// Get all airports
if (isset($_GET['action']) && $_GET['action'] === 'list') {
    echo $airport->getairports();
}

// Get single airport details
if (isset($_GET['action']) && $_GET['action'] === 'details' && isset($_GET['id'])) {
    echo $airport->getairportdetails($_GET['id']);
}

// Delete airport
if (isset($_GET['action']) && $_GET['action'] === 'delete' && isset($_GET['id'])) {
    echo json_encode($airport->deleteairport($_GET['id']));
}
?>
