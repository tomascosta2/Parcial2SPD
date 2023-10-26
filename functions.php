<?php

// Alumno functions -------------------------------------------
function isAlumno() {

}

// Obtener el alumno en sesion
function get_alumno() {

}

// Obtener notas del alumno en sesion
function get_notas() {
    
}


// Profesor functions -----------------------------------------
function isProfesor() {
    echo 'Hola';
    print_r($perro);
    echo mysqli_query($link, 'SELECT sueldo FROM profesores');
    return 'false';
    // if (mysqli_query($link, 'SELECT sueldo FROM profesores')) {
    //     return true;
    // } else {
    //     return false;
    // }
}