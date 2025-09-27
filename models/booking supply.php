<?php
require_once('db.php');

class BookingSupply extends db {

    // Check if a booking supply record exists
    function checkbookingsupply($id, $flight_id, $booking_class_id) {
        $sql = "CALL `sp_checkbookingsupply`({$id}, {$flight_id}, {$booking_class_id})";
        $stmt = $this->getdata($sql);
        $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return count($rows);
    }

    // Save booking supply (insert or update)
    function savebookingsupply($id, $flight_id, $booking_class_id, $number_of_seats, $price, $currency) {
        if ($this->checkbookingsupply($id, $flight_id, $booking_class_id) > 0) {
            return [
                'status' => 'exists',
                'message' => 'Booking supply already exists'
            ];
        } else {
            $sql = "CALL `sp_savebookingsupply`({$id}, {$flight_id}, {$booking_class_id}, {$number_of_seats}, {$price}, '{$currency}')";
            $this->getdata($sql);
            return [
                'status' => 'success',
                'message' => 'Booking supply saved successfully'
            ];
        }
    }

    // Get all booking supplies
    function getbookingsupplies() {
        $sql = "CALL `sp_getbookingsupply`()";
        return $this->getjson($sql);
    }

    // Get details of one booking supply
    function getbookingsupplydetails($id) {
        $sql = "CALL `sp_getbookingsupplydetails`({$id})";
        return $this->getjson($sql);
    }

    // Delete booking supply
    function deletebookingsupply($id) {
        $sql = "CALL `sp_deletebookingsupply`({$id})";
        $this->getdata($sql);
        return [
            'status' => 'success',
            'message' => 'Booking supply deleted successfully'
        ];
    }

    // Filter booking supply (by flight or class, depending on your procedure)
    function filterbookingsupply($filter) {
        $sql = "CALL `sp_filterbookingsupply`('{$filter}')";
        return $this->getjson($sql);
    }
}
?>
