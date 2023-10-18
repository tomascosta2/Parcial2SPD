<?php include('./template-parts/header.php');
include ('./conection.php');
?>

	<section class="es-materias">
		<div class="container">
			<h1 class="mb-4">Hola, Pepito! Con que materia te queres poner al dia hoy?</h1>
			<div class="es-materiasgrid">
				<a href="#!" class="es-materiasgrid__item bg-matematica">
					Matematica
				</a>
				<a href="#!" class="es-materiasgrid__item bg-lengua">
					Lengua
				</a>
				<a href="#!" class="es-materiasgrid__item bg-sociales">
					Sociales
				</a>
				<a href="#!" class="es-materiasgrid__item bg-ingles">
					Ingles
				</a>
				<a href="#!" class="es-materiasgrid__item bg-naturales">
					Naturales
				</a>
			</div>
		</div>
	</section>

	<section class="es-notas mt-5">
		<div class="container">
			<h2 class="text-center mb-5">¡Veamos tus ultimas notas!</h2>
			<table class="w-100">
				<tr>
					<th>Nombre del Alumno</th>
					<th>Nota de Matemáticas</th>
					<th>Nota de Lengua</th>
					<th>Nota de Ciencias</th>
					<th>Promedio</th>
				</tr>
				<tr>
					<td>Juan Pérez</td>
					<td>8.5</td>
					<td>7.2</td>
					<td>9.0</td>
					<td>8.2</td>
				</tr>
				<tr>
					<td>María Rodríguez</td>
					<td>9.0</td>
					<td>8.7</td>
					<td>7.5</td>
					<td>8.4</td>
				</tr>
				<tr>
					<td>Luis García</td>
					<td>7.8</td>
					<td>8.0</td>
					<td>6.5</td>
					<td>7.4</td>
				</tr>
				<!-- Agrega más filas para otros alumnos -->
			</table>
		</div>
	</section>

<?php include('./template-parts/footer.php') ?>