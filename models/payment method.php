<?php
require_once('db.php');

class PaymentMethod extends db {

    // Check if payment method exists
    function checkPaymentMethod($id, $booking_id, $payment_name) {
        $sql = "CALL `sp_checkpaymentmethod`({$id}, {$booking_id}, '{$payment_name}')";
        $stmt = $this->getdata($sql);
        $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return count($rows);
    }

    // Save payment method (insert or update)
    function savePaymentMethod($id, $booking_id, $payment_name) {
        if ($this->checkPaymentMethod($id, $booking_id, $payment_name) > 0) {
            return [
                'status' => 'exists',
                'message' => 'Payment method already exists'
            ];
        } else {
            $sql = "CALL `sp_savepaymentmethod`({$id}, {$booking_id}, '{$payment_name}')";
            $this->getdata($sql);
            return [
                'status' => 'success',
                'message' => 'Payment method saved successfully'
            ];
        }
    }

    // Get all payment methods
    function getPaymentMethods() {
        $sql = "CALL `sp_getpaymentmethod`()";
        return $this->getjson($sql);
    }

    // Get payment method details by ID
    function getPaymentMethodDetails($id) {
        $sql = "CALL `sp_getpaymentmethoddetails`({$id})";
        return $this->getjson($sql);
    }

    // Delete payment method by ID
    function deletePaymentMethod($id) {
        $sql = "CALL `sp_deletepaymentmethod`({$id})";
        $this->getdata($sql);
        return [
            'status' => 'success',
            'message' => 'Payment method deleted successfully'
        ];
    }
}
?>
