<?php
session_start();

class db {
    private $servername;
    private $databasename;
    private $username;
    private $password;
    private $charset;

    // Constructor to set default values
    public function __construct() {
        $this->servername   = 'localhost';
        $this->databasename = 'expediabookingflight'; // ✅ set your DB name
        $this->username     = 'root';                 // adjust if needed
        $this->password     = '';                     // adjust if needed
        $this->charset      = 'utf8mb4';
    }

    // Connect to the database
    public function connect() {
        try {
            $dsn = "mysql:host={$this->servername};dbname={$this->databasename};charset={$this->charset}";
            $pdo = new PDO($dsn, $this->username, $this->password);
            $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            return $pdo;
        } catch (PDOException $e) {
            echo "Connection failed: " . $e->getMessage();
            exit; // stop execution if connection fails
        }
    }

    // Execute a query and return PDOStatement
    public function getData($sql) {
        return $this->connect()->query($sql);
    }

    // Execute a query and return JSON
    public function getJson($sql) {
        $stmt = $this->getData($sql);
        return json_encode($stmt->fetchAll(PDO::FETCH_ASSOC));
    }
}
?>
