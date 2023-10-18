<?php include('./template-parts/header.php');
include ('./conection.php');


$query = "SELECT * from alumnos";
//$sql = "SELECT * FROM alumnos";

if ($result = $mysqli->query($query)) {

    /* Get field information for all columns */
    while ($finfo = $result->fetch_assoc()) {

        // printf("Name:     %s\n", $finfo);
        echo "<pre>";
        print_r($finfo);
        echo "</pre>";
    }
    $result->close();
}

?>