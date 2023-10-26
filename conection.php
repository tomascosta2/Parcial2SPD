<?php
$db_user = "root";
$de_password = "root";

$link = mysqli_connect("127.0.0.1", "root", "root", "alumnos");

if (!$link) {
    echo "Error: No se pudo conectar a MySQL." . PHP_EOL;
    echo "errno de depuración: " . mysqli_connect_errno() . PHP_EOL;
    echo "error de depuración: " . mysqli_connect_error() . PHP_EOL;
    exit;
}

// echo "Éxito: Se realizó una conexión apropiada a MySQL!" . PHP_EOL . "<br>";
// echo "Información del host: " . mysqli_get_host_info($link) . PHP_EOL;

// $dbTablesList = array_column($link->query('SHOW TABLES')->fetch_all(), 0);

// echo '<pre>';
// print_r($dbTablesList);
// echo '</pre>';

// $name = mysqli_query($link, 'SELECT nombre FROM alumnos');
// if ($name) {
//     echo 'Ejecuta correctamente el Query <br>' ;
//     while ($row = mysqli_fetch_assoc($name)) {
//         echo "Nombre: " . $row['nombre'] . "<br>";
//         // Add more information as needed
//         echo "<br>";
//     }
// } else {
//     // Handle query execution errors
//     echo "Error executing query: " . mysqli_error($link);
// }


?>