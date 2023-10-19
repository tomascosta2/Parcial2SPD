<?php include('./template-parts/header.php') ?>

	<div class="es-micuenta">
		<div class="container">
			<h1 class="mb-4">Hola <?php echo 'Pepito' ?></h1>
			<div class="accordion" id="accordionExample">
				<div class="accordion-item">
					<h2 class="accordion-header" id="headingOne">
					<button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
						Materias
					</button>
					</h2>
					<div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
						<div class="accordion-body">
							<ul>
								<li>Matematica</li>
								<li>Lengua</li>
								<li>Sociales</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="accordion-item">
					<h2 class="accordion-header" id="headingTwo">
					<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
						Mis pagos
					</button>
					</h2>
					<div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
						<ul>
							<li>Octubre</li>
							<li>Septiembre</li>
							<li>Octubre</li>
							<li>Octubre</li>
							<li>Octubre</li>
						</ul>
					</div>
				</div>
			</div>
			<ul class="mt-5">
				<li><strong>Nombre completo:</strong> Pepito</li>
				<li><strong>Gmail:</strong> pepito@gmail.com</li>
				<li><strong>Curso:</strong> <a href="<?php echo '#' ?>">7°B</a></li>
				<li><strong>DNI:</strong> 44.625.800</li>
				<li><strong>Tutores:</strong> <a href="<?php echo '#' ?>"> <?php echo 'Papa Pepe' ?></a></li>
			</ul>
		</div>
	</div>

<?php include('./template-parts/footer.php') ?>