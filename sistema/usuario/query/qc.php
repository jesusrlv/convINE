<?php

    $servername="localhost";
    $database="conv_ine"; //solo se quitó para conexión remota
    $username="root";
    $password="";

    $conn= new mysqli ($servername,$username,$password,$database); //solo se quitó para conexión remota
    $conn->set_charset("utf8");
?>