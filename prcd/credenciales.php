<?php
require('conn/qc.php');
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require 'email/prcd/email/Exception.php';
require 'email/prcd/email/PHPMailer.php';
require 'email/prcd/email/SMTP.php';

$email = $_POST['email'];
$sql ="SELECT * FROM usr WHERE usr = '$email'";
$resultadoSql = $conn -> query($sql);
$rowSql = $resultadoSql->fetch_assoc();
$no_resultados = mysqli_num_rows($resultadoSql);

$nombre = $rowSql['nombre'];
$pwd = $rowSql['pwd'];

// if(!empty($rowSql['email'])){
if($no_resultados == 1){

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
            $mail->setFrom('injuventud@zacatecas.gob.mx', 'CONSEJO JUVENIL - INJUVENTUD');
            $mail->addAddress($email, $nombre);     // Add a recipient
        
            // Content
            $mail->isHTML(true);
            $mail->CharSet = 'UTF-8';                                  // Set email format to HTML
            $mail->Subject = 'Recuperar credenciales';
            $mail->Body    = '<p>El presente correo es para recuperar tus credenciales de acceso al sistema del Consejo Juvenil del Estado de Zacatecas.</p>
            
            <p>Usuario: '.$email.'</p>
            <p>Contraseña: '.$pwd.'</p>
            
            <p><strong>Atentamente</strong></p>
            <p>INSTITUTO DE LA JUVENTUD DEL ESTADO DE ZACATECAS</p>';
            $mail->AltBody = 'Mensaje registro';
        
            $mail->send();

            if($mail->send){
                echo'
                <script>
                    alert("Se envío el correo");
                </script>
                ';
                header("Location: ../index.html");
            }
            else{
                echo'
                <script>
                    alert("No se envío el correo");
                </script>
                ';
                header("Location: ../index.html");
            }

        }catch (Exception $e) {
            echo "
           
            Message could not be sent. Mailer Error: {$mail->ErrorInfo}";
        }    
    
}
else{
    echo'
    <script>
    alert("No se envió correo");
    </script>';

}


?>