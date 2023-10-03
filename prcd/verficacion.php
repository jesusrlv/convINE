<?php 
require('conn/qc.php');
sleep(1);
if (isset($_POST)) {
    $username = (string)$_POST['username'];
 
    $result = $conn->query(
        "SELECT * FROM usr WHERE curp = '$username'"
    );
 
    if ($result->num_rows > 0) {
        echo '<div class="alert alert-danger text-start"><strong><i class="bi bi-x-circle-fill"></i> ERROR.</strong> Ya se ha registrado este usuario anteriormente.</div>
        
        <style>
            #boton_submit{display:none;}
        </style>
        ';
    } else {
        echo '<div class="alert alert-success text-start"><strong><i class="bi bi-check-square"></i> CORRECTO.</strong> Usuario disponible.</div>';
    }
}

