<?php
require_once('db.php'); // Assumes db.php defines a PDO connection and helper methods

class BookingType extends db {

    // Check if booking type exists
    function checkbooking($bookingid, $book_name) {
        $sql = "CALL `sp_checkbooking`({$bookingid}, '{$book_name}')";
        $stmt = $this->getdata($sql);
        $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return count($rows);
    }

    // Save booking type (insert or update)
    function savebooking($bookingid, $book_name) {
        if ($this->checkbooking($bookingid, $book_name) > 0) {
            return [
                'status' => 'exists',
                'message' => 'Booking type already exists'
            ];
        } else {
            $sql = "CALL `sp_savebooking`({$bookingid}, '{$book_name}')";
            $this->getdata($sql);
            return [
                'status' => 'success',
                'message' => 'Booking type saved successfully'
            ];
        }
    }

    // Get all booking types
    function getbookings() {
        $sql = "CALL `sp_getbooking`()";
        return $this->getjson($sql);
    }

    // Get details of one booking type
    function getbookingdetails($bookingid) {
        $sql = "CALL `sp_getbookingdetails`({$bookingid})";
        return $this->getjson($sql);
    }

    // Delete booking type
    function deletebooking($bookingid) {
        $sql = "CALL `sp_deletebooking`({$bookingid})";
        $this->getdata($sql);
        return [
            'status' => 'success',
            'message' => 'Booking type deleted successfully'
        ];
    }

    // Filter booking types by name
    function filterbooking($book_name) {
        $sql = "CALL `sp_filterbooking`('{$book_name}')";
        return $this->getjson($sql);
    }
}
?>
