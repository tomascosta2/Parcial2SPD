<?php
$servername = "Localhost";
$username = "root";
$password = "";
$dbname = "alumnos";
$mysqli = new mysqli("localhost", "root", "", "alumnos");

// Create connection
//$conection = mysqli_connect($servername, $username, $password, $dbname);
// Check connection
if (!$mysqli) {
  die("Connection failed: " . mysqli_connect_error());
}
echo "Connected successfully";
?>