<?php
require_once('db.php');

class Airline extends db {

    // ✅ Check if airline exists
    function checkairline($id, $airline_name) {
        $sql = "CALL `checkairline`({$id}, '{$airline_name}')";
        $stmt = $this->getData($sql);
        $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return count($rows);
    }

    // ✅ Save new airline
    function saveairline($id, $airline_name, $logo) {
        if ($this->checkairline($id, $airline_name) > 0) {
            return [
                'status' => 'exists',
                'message' => 'Airline already exists'
            ];
        } else {
            $sql = "CALL `saveairline`({$id}, '{$airline_name}', '{$logo}')";
            $this->getData($sql);
            return [
                'status' => 'success',
                'message' => 'Airline saved successfully'
            ];
        }
    }

    // ✅ Get all airlines
    function getairline() {
        $sql = "CALL `getairline`()";
        return $this->getjson($sql);
    }

    // ✅ Filter airline by name
    function filterairline($airline_name) {
        $sql = "CALL `filterairline`('{$airline_name}')";
        return $this->getjson($sql);
    }

    // ✅ Delete airline
    function deleteairline($id) {
        $sql = "CALL `deleteairline`({$id})";
        $this->getData($sql);
        return [
            'status' => 'success',
            'message' => 'Airline deleted successfully'
        ];
    }
}
?>
