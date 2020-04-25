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
$whatsappObj = new TwilioWhatsapp($sid,$token,$sender_id);
// msg
$message = 'Developed By Shubham';
if(isset($_GET['msg']) && $_GET['msg']){
  $message = str_replace("'", "", $_GET['msg']);  
}
// send single msg
$res_whatsapp = $whatsappObj->send_single_message($receiver_id,$message);
// send multiple msg
// $res_whatsapp = $whatsappObj->send_multiple_message([$receiver_id,$receiver_id],$message);
// prepare response
$data_to_store = ['sender_id'=>$sender_id,'receiver_id'=>$receiver_id,'message'=>$message,'status'=>"send",'response_json'=>json_encode($res_whatsapp)];
// store in db
$res = $whatsappObj->store_log_db($conn,'chat',$data_to_store);
// mysql connection close
$conn->close();

if($res_whatsapp){
    echo 'Message Send Successfully!';
}
?>