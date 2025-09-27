<?php
require_once('db.php');

class PassengerManifest extends db {

    // Check if passenger manifest entry exists
    function checkPassengerManifest($id, $booking_id, $booking_class_id, $name, $dob, $gender) {
        $sql = "CALL `sp_checkpassengermanifest`({$id}, {$booking_id}, {$booking_class_id}, '{$name}', '{$dob}', '{$gender}')";
        $stmt = $this->getdata($sql);
        $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return count($rows);
    }

    // Save passenger manifest (insert or update)
    function savePassengerManifest($id, $booking_id, $booking_class_id, $name, $dob, $gender) {
        if ($this->checkPassengerManifest($id, $booking_id, $booking_class_id, $name, $dob, $gender) > 0) {
            return [
                'status' => 'exists',
                'message' => 'Passenger manifest entry already exists'
            ];
        } else {
            $sql = "CALL `sp_savepassengermanifest`({$id}, {$booking_id}, {$booking_class_id}, '{$name}', '{$dob}', '{$gender}')";
            $this->getdata($sql);
            return [
                'status' => 'success',
                'message' => 'Passenger manifest saved successfully'
            ];
        }
    }

    // Get all passenger manifests
    function getPassengerManifests() {
        $sql = "CALL `sp_getpassengermanifest`()";
        return $this->getjson($sql);
    }

    // Get passenger manifest details by ID
    function getPassengerManifestDetails($id) {
        $sql = "CALL `sp_getpassengermanifestdetails`({$id})";
        return $this->getjson($sql);
    }

    // Delete passenger manifest by ID
    function deletePassengerManifest($id) {
        $sql = "CALL `sp_deletepassengermanifest`({$id})";
        $this->getdata($sql);
        return [
            'status' => 'success',
            'message' => 'Passenger manifest deleted successfully'
        ];
    }
}
?>
