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

$get_record = $whatsappObj->getRecord($conn, 'chat', "WHERE receiver_id = '".$sender_id."' ORDER BY id DESC LIMIT 0,1");
if(!empty($get_record)){
	$lead_id = $get_record[0]['lead_id'];
	$user_id = $get_record[0]['user_id'];
	$bunch_id = $get_record[0]['bunch_id'];
	$status = 1;
	if($_POST['SmsStatus'] == "received"){
	    $status = 2;
	}
	// prepare response
	$data_to_store = ['sender_id'=>$sender_id,'receiver_id'=>$receiver_id,'message'=>$message,'status'=>"receive",'response_json'=>json_encode($_POST),'lead_id'=>$lead_id,'user_id'=>$user_id,'bunch_id'=>$bunch_id,'api_status'=>$status];
	// store in db
	$res = $whatsappObj->store_log_db($conn,"chat",$data_to_store);
	}
}
// mysql connection close
$conn->close();

?>