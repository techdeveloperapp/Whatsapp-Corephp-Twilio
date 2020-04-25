<?php
//CREATE TABLE `users` ( `id` INT NOT NULL AUTO_INCREMENT , `name` VARCHAR(200) NULL , `email` VARCHAR(100) NULL , `mobile` VARCHAR(100) NULL , `profile` VARCHAR(100) NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB;
//ALTER TABLE `users` ADD `type` ENUM('1','2') NOT NULL DEFAULT '1' COMMENT '1->lead,2->user' AFTER `profile`, ADD `created_at` DATETIME NOT NULL AFTER `type`, ADD `deleted_at` DATETIME on update CURRENT_TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP AFTER `created_at`;


include 'config.php';

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
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



?>