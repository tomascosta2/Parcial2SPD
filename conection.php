<?php
$servername = "127.0.0.1:3306";
$username = "root";
$password = "root";

// Create connection
$conection = mysqli_connect($servername, $username, $password, 'Alumnos', 3306);

// Check connection
if (!$conection) {
  die("Connection failed: " . mysqli_connect_error());
}
echo "Connected successfully";
?>