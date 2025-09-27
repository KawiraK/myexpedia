<?php
require_once('db.php');

class Flight extends db {

    // Check if flight exists by id or flight number
    function checkFlight($id, $flight_number) {
        $sql = "CALL `sp_checkflight`({$id}, '{$flight_number}')";
        $stmt = $this->getdata($sql);
        $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return count($rows);
    }

    // Save flight (insert or update)
    function saveFlight($id, $flight_number, $airline_id, $departure_time, $departure_city, $arrival_time, $destination_city) {
        if ($this->checkFlight($id, $flight_number) > 0) {
            return [
                'status' => 'exists',
                'message' => 'Flight already exists'
            ];
        } else {
            $sql = "CALL `sp_saveflight`({$id}, '{$flight_number}', {$airline_id}, '{$departure_time}', '{$departure_city}', '{$arrival_time}', '{$destination_city}')";
            $this->getdata($sql);
            return [
                'status' => 'success',
                'message' => 'Flight saved successfully'
            ];
        }
    }

    // Get all flights
    function getFlights() {
        $sql = "CALL `sp_getflight`()";
        return $this->getjson($sql);
    }

    // Get flight details by id
    function getFlightDetails($id) {
        $sql = "CALL `sp_getflightdetails`({$id})";
        return $this->getjson($sql);
    }

    // Delete flight by id
    function deleteFlight($id) {
        $sql = "CALL `sp_deleteflight`({$id})";
        $this->getdata($sql);
        return [
            'status' => 'success',
            'message' => 'Flight deleted successfully'
        ];
    }
}
?>
