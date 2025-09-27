<?php
require_once('db.php');

class Currencies extends db {

    // Check if currency exists
    function checkcurrency($id, $currencies_name) {
        $sql = "CALL `check`({$id}, '{$currencies_name}')";
        $stmt = $this->getdata($sql);
        $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return count($rows);
    }

    // Save currency (insert or update)
    function savecurrency($id, $currencies_name, $default, $exchange_rate) {
        if ($this->checkcurrency($id, $currencies_name) > 0) {
            return [
                'status' => 'exists',
                'message' => 'Currency already exists'
            ];
        } else {
            $defaultValue = $default ? 1 : 0; // Assuming default is boolean stored as int
            $sql = "CALL `save`({$id}, '{$currencies_name}', {$defaultValue}, {$exchange_rate})";
            $this->getdata($sql);
            return [
                'status' => 'success',
                'message' => 'Currency saved successfully'
            ];
        }
    }

    // Get all currencies
    function getcurrencies() {
        $sql = "CALL `get`()";
        return $this->getjson($sql);
    }

    // Get details of one currency
    function getcurrencydetails($id) {
        // Assuming 'get' proc accepts ID to fetch one
        $sql = "CALL `get`({$id})";
        return $this->getjson($sql);
    }

    // Delete currency
    function deletecurrency($id) {
        $sql = "CALL `delete`({$id})";
        $this->getdata($sql);
        return [
            'status' => 'success',
            'message' => 'Currency deleted successfully'
        ];
    }
}
?>
