<?php 

// Table Structure
// CREATE TABLE `chat` ( `id` INT(11) NOT NULL AUTO_INCREMENT , `sender_id` VARCHAR(50) NOT NULL , `receiver_id` VARCHAR(50) NOT NULL , `message` TEXT NOT NULL , `status` ENUM('send','receive') NOT NULL , `response_json` LONGTEXT NOT NULL , `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP , `updated_at` DATETIME on update CURRENT_TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP , PRIMARY KEY (`id`)) ENGINE = InnoDB;
//End
include 'TwilioWhatsapp.php';

include 'config.php';

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// create obj
if($_POST){
$whatsappObj = new TwilioWhatsapp($sid,$token,$sender_id);
// msg
$message = $_POST['Body'];
$sender_id = explode(':',$_POST['From'])[1];
$receiver_id = explode(':',$_POST['To'])[1];
$SmsSid = '"'.$_POST['SmsSid'].'"';
$get_record = $whatsappObj->getRecord($conn, 'chat', "WHERE response_json = '".$SmsSid."' ORDER BY id DESC LIMIT 0,1");
if(!empty($get_record)){
	$lead_id = $get_record[0]['lead_id'];
	$user_id = $get_record[0]['user_id'];
	$sms_status = $_POST['SmsStatus'];
	$api_status = '4';
	if($sms_status == "sent"){
	    $api_status = '1';
	}else if($sms_status == "delivered"){
	    $api_status = '2';
	}
	// store in db
	$res = $whatsappObj->update_log_db($conn,"chat","WHERE id = ".$get_record[0]['id']."","api_status = ".$api_status."");
	}
}
// mysql connection close
$conn->close();

?>