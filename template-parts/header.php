<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Escuelita ~ Cuidando el futuro de tus hijos desde 1970</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<link rel="stylesheet" href="main.css">
</head>
<body>
	<div class="container">
		<header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
		<a href="/Parcial2SPD/" class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
			Escuelita
		</a>

		<ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
			<li><a href="#" class="nav-link px-2 link-dark">Inicio</a></li>
			<li><a href="#" class="nav-link px-2 link-dark">Materias</a></li>
			<li><a href="#" class="nav-link px-2 link-dark">Mi curso</a></li>
		</ul>

		<div class="col-md-3">
			<div class="d-flex gap-2 justify-content-end">
				<?php if ($_SESSION['user_id']) : ?>
					<a href="/Parcial2SPD/mi-cuenta.php" class="nav-link px-2 link-dark">Mi cuenta</a>
					<a href="/Parcial2SPD/cerrar-sesion.php" class="nav-link px-2 link-dark">Cerrar Sesion</a>
				<?php endif; ?>
			</div>
		</div>
		</header>
	</div>