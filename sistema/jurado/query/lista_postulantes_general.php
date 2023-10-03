<?php
include('qc.php');
// Mx
$sqlPostulantes ="SELECT * FROM usr WHERE perfil = 1 or perfil = 4";
$resultadoSQL = $conn->query($sqlPostulantes);
$x = 0;
while($rowSQL = $resultadoSQL->fetch_assoc()){
    
    $idDocs = $rowSQL['id'];
    $contador = "SELECT COUNT(documento) AS contar FROM documentos WHERE id_ext = '$idDocs'";
    $resultadoContar = $conn->query($contador);
    $rowContar = $resultadoContar -> fetch_assoc();
    $numero = $rowContar['contar'];
    if($numero == 9){
        $calif = "SELECT * FROM calificacion WHERE id_ext = '$idDocs'";
        $resultadoCalif = $conn->$query($calif);
        $rowFila = $resultadoCalif->num_rows;


    $x++;
    echo'
    <tr>
        <td>'.$x.'</td>
        <td>'.$rowSQL['nombre'].'</td>
        <td>'.$rowSQL['curp'].'</td>
        <td>'.$rowSQL['edad'].'</td>';
        if(isset($rowSQL['municipio'])){
        $mun = $rowSQL['municipio'];
        $sqlMunicipio = "SELECT * FROM municipio WHERE id = '$mun'";
        $resultadoMunicipio = $conn -> query($sqlMunicipio);
        $rowMunicipio = $resultadoMunicipio->fetch_assoc();
        echo'
            <td>'.$rowMunicipio['municipio'].'</td>
            ';
        }else{
            echo'
            <td>Migrante</td>';
        }
    echo'
        <td>'.$rowSQL['telefono'].'</td>
        <td>
            <a href="listado_docs.php?id='.$rowSQL['id'].'">';
        if ($numero == 0){
            echo'
            <span class="badge rounded-pill text-bg-danger">
            ';
        }
        else if ($numero == 1 || $numero == 2 || $numero == 3 || $numero == 4 || $numero == 5 || $numero == 6 || $numero == 7 || $numero == 8){
            echo'
            <span class="badge rounded-pill text-bg-warning">
            ';
        }
        else if ($numero == 9){
            echo'
            <span class="badge rounded-pill text-bg-primary">
            ';
        }
            echo'
                '.$numero.'
            </span>
            </a>
        </td>
        <td>';

        	if($rowFila == null || $rowFila == 0){
        	echo'
        	Sin calificar';
        	}
        	else if($rowFila == 1){
        	echo'
        	Falta calificar 1 documento';
        	}
        	else if($rowFila == 2){
        	echo'
        	Calificado';
        	}
        
            echo'
            </td>
    </tr>
';
}
}


?>