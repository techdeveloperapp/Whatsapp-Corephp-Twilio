<?php 

// Table Structure
// CREATE TABLE `chat` ( `id` INT(11) NOT NULL AUTO_INCREMENT , `sender_id` VARCHAR(50) NOT NULL , `receiver_id` VARCHAR(50) NOT NULL , `message` TEXT NOT NULL , `status` ENUM('send','receive') NOT NULL , `response_json` LONGTEXT NOT NULL , `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP , `updated_at` DATETIME on update CURRENT_TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP , PRIMARY KEY (`id`)) ENGINE = InnoDB;
//ALTER TABLE `chat` ADD `lead_id` INT NULL AFTER `response_json`, ADD `user_id` INT NULL AFTER `lead_id`;
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
$res_whatsapp = false;
if(isset($_POST['user_id']) && isset($_POST['lead_id']) && isset($_POST['message']) && isset($_POST['receiver_id']) && $_POST['user_id'] && $_POST['lead_id'] && $_POST['message']){
  $message = str_replace("'", "", $_POST['message']); 
  $user_id = str_replace("'", "", $_POST['user_id']);
  $lead_id = str_replace("'", "", $_POST['lead_id']);
  $receiver_id = str_replace("'", "", $_POST['receiver_id']);

  // send single msg
  $res_whatsapp = $whatsappObj->send_single_message($receiver_id,$message);


  $data_to_store = ['sender_id'=>$sender_id,'receiver_id'=>$receiver_id,'message'=>$message,'status'=>"send",'response_json'=>json_encode($res_whatsapp),'user_id'=>$user_id,'lead_id'=>$lead_id,'api_status'=>'2'];
  // store in db
  $res = $whatsappObj->store_log_db($conn,'chat',$data_to_store);
  // mysql connection close

  if($res){
  	$conn->close();
  	return true;
  }
}
$conn->close();


if($res_whatsapp){
    echo 'Message Send Successfully!';
}
?>