<?php
require_once('db.php');

class Booking extends db {

    // Check if booking exists
    function checkbooking($id, $booking_type_id, $flight_id, $booking_date, $payment_method) {
        $sql = "CALL `sp_checkbooking`({$id}, {$booking_type_id}, {$flight_id}, '{$booking_date}', '{$payment_method}')";
        $stmt = $this->getdata($sql);
        $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return count($rows);
    }

    // Save booking (insert or update)
    function savebooking($id, $booking_type_id, $flight_id, $booking_date, $payment_method) {
        if ($this->checkbooking($id, $booking_type_id, $flight_id, $booking_date, $payment_method) > 0) {
            return [
                'status' => 'exists',
                'message' => 'Booking already exists'
            ];
        } else {
            $sql = "CALL `sp_savebooking`({$id}, {$booking_type_id}, {$flight_id}, '{$booking_date}', '{$payment_method}')";
            $this->getdata($sql);
            return [
                'status' => 'success',
                'message' => 'Booking saved successfully'
            ];
        }
    }

    // Get all bookings
    function getbookings() {
        $sql = "CALL `sp_getbooking`()";
        return $this->getjson($sql);
    }

    // Get booking details
    function getbookingdetails($id) {
        $sql = "CALL `sp_getbookingdetails`({$id})";
        return $this->getjson($sql);
    }

    // Delete booking
    function deletebooking($id) {
        $sql = "CALL `sp_deletebooking`({$id})";
        $this->getdata($sql);
        return [
            'status' => 'success',
            'message' => 'Booking deleted successfully'
        ];
    }

    // Filter bookings (by type, flight, or payment depending on your proc)
    function filterbooking($filter) {
        $sql = "CALL `sp_filterbooking`('{$filter}')";
        return $this->getjson($sql);
    }
}
?>
