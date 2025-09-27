<?php
require_once('db.php');

class Airport extends db {

    // Check if airport exists
    function checkairport($airportid, $code) {
        $sql = "CALL `sp_checkairport`({$airportid}, '{$code}')";
        $stmt = $this->getdata($sql);
        $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return count($rows);
    }

    // Save airport (insert or update)
    function saveairport($airportid, $code, $city_id) {
        if ($this->checkairport($airportid, $code) > 0) {
            return [
                'status' => 'exists',
                'message' => 'Airport already exists'
            ];
        } else {
            $sql = "CALL `sp_saveairport`({$airportid}, '{$code}', {$city_id})";
            $this->getdata($sql);
            return [
                'status' => 'success',
                'message' => 'Airport saved successfully'
            ];
        }
    }

    // Get all airports
    function getairports() {
        $sql = "CALL `sp_getairport`()";
        return $this->getjson($sql);
    }

    // Get details of one airport
    function getairportdetails($airportid) {
        $sql = "CALL `sp_getairportdetails`({$airportid})";
        return $this->getjson($sql);
    }

    // Delete airport
    function deleteairport($airportid) {
        $sql = "CALL `sp_deleteairport`({$airportid})";
        $this->getdata($sql);
        return [
            'status' => 'success',
            'message' => 'Airport deleted successfully'
        ];
    }

    // Filter airports (by code)
    function filterairport($code) {
        $sql = "CALL `sp_filterairport`('{$code}')";
        return $this->getjson($sql);
    }
}
?>
