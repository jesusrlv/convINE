<?php
require('conn/qc.php');
        use PHPMailer\PHPMailer\PHPMailer;
        use PHPMailer\PHPMailer\Exception;

        require 'email/prcd/email/Exception.php';
        require 'email/prcd/email/PHPMailer.php';
        require 'email/prcd/email/SMTP.php';
// if (isset($_POST['usr']) && isset($_POST['pwd'])) {
   
    $nombre = $_POST['nombre'];
    $telefono = $_POST['telefono'];
    $domicilio = $_POST['domicilio'];
    $escuela = $_POST['escuela'];
    $gradoEstudio = $_POST['gradoEstudio'];
    $municipio = $_POST['municipio'];
    $curp = $_POST['curp'];
    $edad = $_POST['edad'];
    $email = $_POST['email'];
    $pwd = $_POST['pwd'];
    $perfil = 1;

    $sql = "INSERT INTO usr(
        usr,
        nombre,
        telefono,
        municipio,
        curp,
        edad,
        pwd,
        perfil,
        domicilio,
        escuela,
        gradoEstudio
        )
        VALUES(
            '$email',
            '$nombre',
            '$telefono',
            '$municipio',
            '$curp',
            '$edad',
            '$pwd',
            '$perfil',
            '$domicilio',
            '$escuela',
            '$gradoEstudio'
            )
        ";
        // email
        $mail = new PHPMailer(true);

        try {

            //Server settings
        $mail->SMTPDebug = 0;                                       // Enable verbose debug output
        $mail->isSMTP();                                            // Set mailer to use SMTP
        //$mail->Host       = 'smtp.gmail.com';  // Specify main and backup SMTP servers
        $mail->Host = 'mailc76.carrierzone.com';  // Specify main and backup SMTP servers
        $mail->SMTPAuth   = true;                                   // Enable SMTP authentication
        $mail->Username = 'injuventud@zacatecas.gob.mx';                     // SMTP username
        $mail->Password = 'A61q%9zev%z!W';                               // SMTP password
        $mail->SMTPSecure = 'SSL';                                  // Enable TLS encryption, `ssl` also accepted
        $mail->Port = 587;                                    // TCP port to connect to 587 465
        
            //Recipients
            $mail->setFrom('injuventud@zacatecas.gob.mx', 'INJUVENTUD');
            $mail->addAddress($email, $nombre);     // Add a recipient
        
            // Content
            $mail->isHTML(true);
            $mail->CharSet = 'UTF-8';                                  // Set email format to HTML
            $mail->Subject = 'Registro exitoso';
            $mail->Body    = '<p>Te has registrado exitosamente a la plataforma del Concurso Juvenil de Debate 2023.</p>
            
            <p><strong>Usuario:</strong> '.$email.'</p>
           
            <p><strong>Contraseña:</strong> '.$pwd.'</p>
            
            <p><strong>Atentamente</strong></p>
            INSTITUTO DE LA JUVENTUD DEL ESTADO DE ZACATECAS';
            $mail->AltBody = 'Mensaje registro';
        
            $mail->send();

            

        }catch (Exception $e) {
            echo "
           
            Message could not be sent. Mailer Error: {$mail->ErrorInfo}";
        }  
    $resultado_sql = $conn->query($sql);
    if($resultado_sql){
        echo json_encode(array('success' => 1));
        
    }
    else{
        echo json_encode(array('success' => 0));
        
    }

    
    ?>