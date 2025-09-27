<?php
require_once('db.php');

class Country extends db {

    // Check if country exists
    function checkcountry($id, $country_name) {
        $sql = "CALL `check`({$id}, '{$country_name}')";
        $stmt = $this->getdata($sql);
        $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return count($rows);
    }

    // Save country (insert or update)
    function savecountry($id, $country_name) {
        if ($this->checkcountry($id, $country_name) > 0) {
            return [
                'status' => 'exists',
                'message' => 'Country already exists'
            ];
        } else {
            $sql = "CALL `save`({$id}, '{$country_name}')";
            $this->getdata($sql);
            return [
                'status' => 'success',
                'message' => 'Country saved successfully'
            ];
        }
    }

    // Get all countries
    function getcountries() {
        $sql = "CALL `get`()";
        return $this->getjson($sql);
    }

    // Get details of one country
    function getcountrydetails($id) {
        // Assuming stored proc 'get' returns one country if id given, else all
        $sql = "CALL `get`({$id})";
        return $this->getjson($sql);
    }

    // Delete country
    function deletecountry($id) {
        $sql = "CALL `delete`({$id})";
        $this->getdata($sql);
        return [
            'status' => 'success',
            'message' => 'Country deleted successfully'
        ];
    }
}
?>
