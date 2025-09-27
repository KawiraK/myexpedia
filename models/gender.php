<?php
require_once('db.php');

class Gender extends db {

    // Check if gender exists
    function checkGender($id, $gender_name) {
        $sql = "CALL `sp_checkgender`({$id}, '{$gender_name}')";
        $stmt = $this->getdata($sql);
        $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return count($rows);
    }

    // Save gender (insert or update)
    function saveGender($id, $gender_name) {
        if ($this->checkGender($id, $gender_name) > 0) {
            return [
                'status' => 'exists',
                'message' => 'Gender already exists'
            ];
        } else {
            $sql = "CALL `sp_savegender`({$id}, '{$gender_name}')";
            $this->getdata($sql);
            return [
                'status' => 'success',
                'message' => 'Gender saved successfully'
            ];
        }
    }

    // Get all genders
    function getGenders() {
        $sql = "CALL `sp_getgender`()";
        return $this->getjson($sql);
    }

    // Get gender details by ID
    function getGenderDetails($id) {
        $sql = "CALL `sp_getgenderdetails`({$id})";
        return $this->getjson($sql);
    }

    // Delete gender by ID
    function deleteGender($id) {
        $sql = "CALL `sp_deletegender`({$id})";
        $this->getdata($sql);
        return [
            'status' => 'success',
            'message' => 'Gender deleted successfully'
        ];
    }
}
?>
