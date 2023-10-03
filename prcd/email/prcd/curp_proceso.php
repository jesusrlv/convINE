<?php
    error_reporting(E_ALL);
    ini_set('display_errors', '1');
?>

<!DOCTYPE html>
   <html>
    
    <head>

        

       <meta charset="utf-8">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
        <script src="sweetalert2.all.min.js"></script>
<!-- Optional: include a polyfill for ES6 Promises for IE11 and Android browser -->
<script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>
    </head>
<body>

<?php

    //validación
    include('../../dashboard/prcd/conn.php');
    $curp= $_POST['usuario'];
    $validacion="SELECT * FROM usr WHERE usuario='$curp'";
    $validar=$conn->query($validacion);
    $row=$validar->fetch_assoc();


$row_cnt = $validar->num_rows;

    use PHPMailer\PHPMailer\PHPMailer;
    use PHPMailer\PHPMailer\Exception;

    require 'email/Exception.php';
    require 'email/PHPMailer.php';
    require 'email/SMTP.php';
    

if($row_cnt == 0){
    //codigo aleatorio
    echo "<script type=\"text/javascript\">Swal.fire(
        'No existe este usuario',
        'Favor de registrarte en la plataforma',
        'warning'
      ).then(function(){window.location='../index.php';});</script>";
}
else{
   
    $usuario=$row['usuario'];
    $pwd=$row['pwd'];
    $nombre=$row['nombre'];
    $email=$row['correo'];


$mail = new PHPMailer(true);

try {
    //Server settings
    $mail->SMTPDebug = 0;                                       // Enable verbose debug output
    $mail->isSMTP();                                            // Set mailer to use SMTP
    $mail->Host       = 'smtp.correoexchange.com.mx';  // Specify main and backup SMTP servers
    $mail->SMTPAuth   = true;                                   // Enable SMTP authentication
    $mail->Username   = 'injuventud@zacatecas.gob.mx';                     // SMTP username
    $mail->Password   = 'ONvJ1Nc4Rp';                               // SMTP password
    $mail->SMTPSecure = 'TLS';                                  // Enable TLS encryption, `ssl` also accepted
    $mail->Port       = 587;                                    // TCP port to connect to

    //Recipients
    $mail->setFrom('injuventud@zacatecas.gob.mx', 'INJUVENTUD');
    $mail->addAddress($email, $nombre);     // Add a recipient

    // Content
    $mail->isHTML(true);
    $mail->CharSet = 'UTF-8';                                  // Set email format to HTML
    $mail->Subject = 'Recuperar datos de usuario';
    $mail->Body    = 'Este mensaje es para recuperar tus datos de acceso a la plataforma del <b>Concurso Juvenil de Debate 2023</b>.<br><br>Usuario: '.$usuario.'<br>Contraseña: '.$pwd.'';
    $mail->AltBody = 'Mensaje para recuperar acceso';

    $mail->send();
    // echo 'Message has been sent';
    echo "<script type=\"text/javascript\">Swal.fire(
        'Usuario ya registrado',
        'Se envió a tu correo electrónico tu usuario y contraseña',
        'warning'
      ).then(function(){window.location='../../index.php';});</script>";

} catch (Exception $e) {
    echo "Message could not be sent. Mailer Error: {$mail->ErrorInfo}";
    echo $email;
}

}    
?>


</body>

</html>