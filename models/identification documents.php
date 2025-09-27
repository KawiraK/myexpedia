<?php
require_once('db.php');

class IdentificationDocument extends db {

    // Check if identification document exists
    function checkIdentification($id, $identification_name) {
        $sql = "CALL `sp_checkidentification`({$id}, '{$identification_name}')";
        $stmt = $this->getdata($sql);
        $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return count($rows);
    }

    // Save identification document (insert or update)
    function saveIdentification($id, $identification_name) {
        if ($this->checkIdentification($id, $identification_name) > 0) {
            return [
                'status' => 'exists',
                'message' => 'Identification document already exists'
            ];
        } else {
            $sql = "CALL `sp_saveidentification`({$id}, '{$identification_name}')";
            $this->getdata($sql);
            return [
                'status' => 'success',
                'message' => 'Identification document saved successfully'
            ];
        }
    }

    // Get all identification documents
    function getIdentifications() {
        $sql = "CALL `sp_getidentification`()";
        return $this->getjson($sql);
    }

    // Get identification document details by ID
    function getIdentificationDetails($id) {
        $sql = "CALL `sp_getidentificationdetails`({$id})";
        return $this->getjson($sql);
    }

    // Delet
    
