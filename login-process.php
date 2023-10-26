<?php 
session_start();
include ('./conection.php');

$username = $_POST['user'];
$password = $_POST['password'];

// Estuve dos horas sin saber porque no funcionaba esta linea y era por la ñ :)
$stmt = $link->prepare("SELECT idAlumno, nombre, contrasena FROM alumnos WHERE idAlumno = ?"); 
if (!$stmt) {
    die("Error in preparing the statement: " . $link->error);
}
$stmt->bind_param("s", $username);

echo 'pase';

if ($stmt->execute()) {
    $stmt->bind_result($id, $db_username, $db_password);
    $stmt->fetch();
    echo 'Dni:';
    echo $id . '<br>';
    echo 'Contraseña:';
    echo $db_password . '<br>';
    // if (password_verify($password, $db_password)) {
    if ($password == $db_password) {
        $_SESSION['user_id'] = $id;
        echo 'Session ID:';
        echo $_SESSION['user_id'];
        header("Location: index.php"); // Redirige a la página de inicio después del inicio de sesión
    } else {
        echo "Credenciales incorrectas. <a href='login.php'>Volver a intentar</a>";
    }
} else {
    echo "Error en la consulta.";
}