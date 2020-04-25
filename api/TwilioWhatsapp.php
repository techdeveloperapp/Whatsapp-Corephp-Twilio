<?php

//Update the path below to your autoload.php,
//see https://getcomposer.org/doc/01-basic-usage.md
require_once 'vendor/autoload.php';

use Twilio\Rest\Client;

// Find your Account Sid and Auth Token at twilio.com/console
// DANGER! This is insecure. See http://twil.io/secure

class TwilioWhatsapp{

	private $twilio; 
	private $sender_id;
	public function __construct($sid="ACcccfe6ce8d9b9e8ec0ed9e42284bc92f",$token="a488962c6601c34ddb1f8d328a0ab6ac",$sender_id="whatsapp:+14155238886"){
		$this->twilio = new Client($sid, $token);
		$this->sender_id = $sender_id;
	}

	function send_single_message($to_id="+918318080107",$message){
			$message = $this->twilio->messages
			                  ->create("whatsapp:".$to_id, // to
			                           [
			                               "from" => "whatsapp:".$this->sender_id,
			                               //"mediaUrl" => 'media_path',
			                               "body" => $message
			                           ]
			                  );
			return $message->sid;
	}
	
	function send_multiple_message($to_id=["+918318080107","+919875444120"],$message){
	    $response = [];
	    foreach($to_id as $to){
	        $message = $this->twilio->messages
			                  ->create("whatsapp:".$to, // to
			                           [
			                               "from" => "whatsapp:".$this->sender_id,
			                               //"mediaUrl" => 'media_path',
			                               "body" => $message
			                           ]
			                  );
			$response[] = $message->sid;
	    }
	    return $response;
			
	}

	function store_log_db($conn,$table_name="chat",$insData){
		$value = array_values($insData);
		$record = '';
		$count = count($value)-1;
		foreach($value as $key=>$val){
			if($count == $key){
			 $record .= "'".$val."'";
			}else{
			 $record .= "'".$val."',";
			}
		}

		$sql = 'INSERT INTO '.$table_name.' ('.implode(", ",array_keys($insData)).')
				VALUES ('.$record.');';
		if ($conn->query($sql) === TRUE) {
		    return "Message Send Successfully";
		} else {
		    return "Error: " . $sql . "<br>" . $conn->error;
		}
	}
	
	function getRecord($conn, $table, $condition='WHERE status = 1'){
		if($condition){
			$sql = "SELECT * FROM ".$table." ".$condition."";
		}else{
			$sql = "SELECT * FROM ".$table."";
		}
		$result = $conn->query($sql);
		$data = [];
		if ($result->num_rows > 0) {
		    // output data of each row
		    while($row = $result->fetch_assoc()) {
		      $data[] = $row;  
		    }
		}
		return $data;
	}
	
	function update_log_db($conn, $table, $condition, $insData){
        $sql = 'UPDATE '.$table.' SET '.$insData.' '.$condition.'';
		if ($conn->query($sql) === TRUE) {
		    return "Message Send Successfully";
		} else {
		    return "Error: " . $sql . "<br>" . $conn->error;
		}
	}
}
