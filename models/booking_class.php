<?php
require_once('db.php');

class BookingClass extends db {

    // Check if booking class exists
    function checkbookingclass($id, $flight_id, $type_name) {
        $sql = "CALL `sp_checkbookingclass`({$id}, {$flight_id}, '{$type_name}')";
        $stmt = $this->getdata($sql);
        $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return count($rows);
    }

    // Save booking class (insert or update)
    function savebookingclass($id, $flight_id, $type_name) {
        if ($this->checkbookingclass($id, $flight_id, $type_name) > 0) {
            return [
                'status' => 'exists',
                'message' => 'Booking class already exists'
            ];
        } else {
            $sql = "CALL `sp_savebookingclass`({$id}, {$flight_id}, '{$type_name}')";
            $this->getdata($sql);
            return [
                'status' => 'success',
                'message' => 'Booking class saved successfully'
            ];
        }
    }

    // Get all booking classes
    function getbookingclasses() {
        $sql = "CALL `sp_getbookingclass`()";
        return $this->getjson($sql);
    }

    // Get details of one booking class
    function getbookingclassdetails($id) {
        $sql = "CALL `sp_getbookingclassdetails`({$id})";
        return $this->getjson($sql);
    }

    // Delete booking class
    function deletebookingclass($id) {
        $sql = "CALL `sp_deletebookingclass`({$id})";
        $this->getdata($sql);
        return [
            'status' => 'success',
            'message' => 'Booking class deleted successfully'
        ];
    }

}
?>
