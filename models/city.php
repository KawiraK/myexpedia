<?php
require_once('db.php');

class City extends db {

    // Check if city exists
    function checkcity($cityid, $city_name, $countryid) {
        $sql = "CALL `sp_checkcity`({$cityid}, '{$city_name}', {$countryid})";
        $stmt = $this->getdata($sql);
        $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return count($rows);
    }

    // Save city (insert or update)
    function savecity($cityid, $city_name, $countryid) {
        if ($this->checkcity($cityid, $city_name, $countryid) > 0) {
            return [
                'status' => 'exists',
                'message' => 'City already exists'
            ];
        } else {
            $sql = "CALL `sp_savecity`({$cityid}, '{$city_name}', {$countryid})";
            $this->getdata($sql);
            return [
                'status' => 'success',
                'message' => 'City saved successfully'
            ];
        }
    }

    // Get all cities
    function getcities() {
        $sql = "CALL `sp_getcity`()";
        return $this->getjson($sql);
    }

    // Get details of one city
    function getcitydetails($cityid) {
        $sql = "CALL `sp_getcitydetails`({$cityid})";
        return $this->getjson($sql);
    }

    // Delete city
    function deletecity($cityid) {
        $sql = "CALL `sp_deletecity`({$cityid})";
        $this->getdata($sql);
        return [
            'status' => 'success',
            'message' => 'City deleted successfully'
        ];
    }

    // Filter cities by name
    function filtercity($city_name) {
        $sql = "CALL `sp_filtercity`('{$city_name}')";
        return $this->getjson($sql);
    }
}
?>
