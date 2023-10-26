<?php 
session_start();
include('./template-parts/header.php');
include('./conection.php');
if (isset($_SESSION['user_id'])) {
	// El usuario ha iniciado sesión, puedes acceder al ID de usuario
    $user_id = $_SESSION['user_id'];
	// print_r($link);
	$user_name_query = mysqli_query($link, 'SELECT nombre FROM alumnos WHERE idAlumno = 1');
	// echo $user_id;

	$user_name = mysqli_fetch_assoc($user_name_query);

    // echo "El ID de usuario es: $user_id";
    // echo "El Nombre de usuario es: " . $user_name;
} else {
    // El usuario no ha iniciado sesión, puedes redirigirlo a la página de inicio de sesión
    header("Location: login.php");
    exit();
}
?>
<div class="container">
	<section class="es-materias">
		<div class="container">
			<h1 class="mb-4">Hola, <?php echo $user_name['nombre'] ?>! Con que materia nos ponemos al dia hoy?</h1>
			<div class="es-materiasgrid">
				<?php
				$get_materias = mysqli_query($link, 'SELECT * FROM materias');
				while ($materias = mysqli_fetch_assoc($get_materias)) {
					echo '<a href="' . $materias['url'] . '" class="es-materiasgrid__item bg-' . $materias['Nombre'] . '">';
					print_r($materias['Nombre']);
					echo '</a>';
				}
				?>
			</div>
		</div>
	</section>
</div>
<?php include('./template-parts/footer.php') ?>