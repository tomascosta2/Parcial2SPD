<?php
session_start();
include('./template-parts/header.php');
include ('./conection.php');
?>

<form action="login-process.php" method="post" class="w-50 mx-auto">
    <div class="d-flex flex-column gap-2">
        <label for="user">DNI</label>
        <input name="user" type="text">
    </div>
    <div class="d-flex flex-column gap-2">
        <label for="password">Contraseña</label>
        <input name="password" type="password">
    </div>
    <button type="submit">Entrar</button>
</form>

<?php include('./template-parts/footer.php') ?>