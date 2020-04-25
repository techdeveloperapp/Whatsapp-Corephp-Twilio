<?php
include 'api/users.php';

// Init When Page is Load
$users = getRecord($conn, 'users', 'WHERE status = 1 LIMIT 0,1');
if(isset($_GET['id']) && $_GET['id']){
  $users = getRecord($conn, 'users', 'WHERE status = 1 AND id = '.$_GET['id'].' LIMIT 0,1');
}
$leads = getRecord($conn, 'leads', 'WHERE status = 1 AND assign_id = '.$users[0]['id'].' ORDER BY id DESC LIMIT 0,15');

// Request for getting message
// Get Recent Message
if(isset($_POST['recent']) && $_POST['recent']){
$lead_id = $_POST['lead_id'];
$user_id = $_POST['user_id'];
$message = array_reverse(getRecord($conn, 'chat', 'WHERE lead_id = '.$lead_id.' AND user_id = '.$user_id.' ORDER BY id DESC LIMIT 0,15'));
echo json_encode($message);die;
}
?>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<!DOCTYPE html>
<html lang="en">

<head>
  <title>Whatsapp Template</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="assets/css/bootstrap.min.css">
  <link rel="stylesheet" href="assets/style.css">
  <!-- Font Awesome File -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  
  
  <script src="assets/jquery.min.js"></script>
</head>

<body>

  <div class="container app">
    <div class="row app-one">

      <div class="col-sm-4 side">
        <div class="side-one">
          <!-- Heading -->
          <div class="row heading">
            <div class="col-sm-2 col-xs-2 heading-avatar">
              <div class="heading-avatar-icon">
                <img src="<?php echo $users[0]['profile']; ?>">
              </div>
            </div>
             <div class="col-sm-3 col-xs-3 pull-left title_chat">
              <?php echo $users[0]['name']; ?>
            </div>
            <div class="col-sm-1 col-xs-1  heading-dot  pull-right">
              <i class="fa fa-ellipsis-v fa-2x  pull-right" aria-hidden="true"></i>
            </div>
            <div class="col-sm-2 col-xs-2 heading-compose  pull-right">
              <i class="fa fa-comments fa-2x  pull-right" aria-hidden="true"></i>
            </div>
           
          </div>
          <!-- Heading End -->

          <!-- SearchBox -->
          <div class="row searchBox">
            <div class="col-sm-12 searchBox-inner">
              <div class="form-group has-feedback">
                <input id="searchText" type="text" class="form-control" name="searchText" placeholder="Search">
                <span class="glyphicon glyphicon-search form-control-feedback"></span>
              </div>
            </div>
          </div>

          <!-- Search Box End -->
          <!-- sideBar -->
          
          <div class="row sideBar">
            <?php $i=1; foreach($leads as $lead){ ?>
            <div class="<?php echo ($i==1 ? 'row sideBar-body active' : 'row sideBar-body'); ?>">
              <div class="col-sm-3 col-xs-3 sideBar-avatar">
                <div class="avatar-icon">
                  <img src="<?= $lead['profile']; ?>">
                </div>
              </div>
              <div class="col-sm-9 col-xs-9 sideBar-main">
                <div class="row">
                  <div class="col-sm-8 col-xs-8 sideBar-name">
                    <span class="name-meta"><?= $lead['name']; ?>
                  </span>
                  </div>
                  <div class="col-sm-4 col-xs-4 pull-right sideBar-time">
                    <span class="time-meta pull-right">Chat Now
                  </span>
                  </div>
                </div>
              </div>
              <div class="details" style="display:none;">
                <span class="lead_id"><?= $lead['id']; ?></span>
                <span class="reciver_id"><?= $lead['mobile']; ?></span>
                <span class="user_id"><?= $users[0]['id']; ?></span>
              </div>
            </div>
            <?php $i++; } ?>
          </div>
          <!-- Sidebar End -->
        </div>
        <div class="side-two">

          <!-- Heading -->
          <div class="row newMessage-heading">
            <div class="row newMessage-main">
              <div class="col-sm-2 col-xs-2 newMessage-back">
                <i class="fa fa-arrow-left" aria-hidden="true"></i>
              </div>
              <div class="col-sm-10 col-xs-10 newMessage-title">
                New Chat
              </div>
            </div>
          </div>
          <!-- Heading End -->

          <!-- ComposeBox -->
          <div class="row composeBox">
            <div class="col-sm-12 composeBox-inner">
              <div class="form-group has-feedback">
                <input id="composeText" type="text" class="form-control" name="searchText" placeholder="Search People">
                <span class="glyphicon glyphicon-search form-control-feedback"></span>
              </div>
            </div>
          </div>
          <!-- ComposeBox End -->
        </div>
        <!-- Sidebar End -->
      </div>


      <!-- New Message Sidebar End -->

      <!-- Conversation Start -->
      <div class="col-sm-8 conversation">
        <!-- Heading -->
        <div class="row heading">
          <div class="col-sm-2 col-md-1 col-xs-3 heading-avatar">
            <div class="heading-avatar-icon">
              <img src="<?php echo $leads[0]['profile']; ?>">
            </div>
          </div>
          <div class="col-sm-8 col-xs-7 heading-name">
            <a class="heading-name-meta"><?php echo $leads[0]['name']; ?>
            </a>
            <span class="heading-online">Online</span>
          </div>
          <div class="col-sm-1 col-xs-1  heading-dot pull-right">
            <i class="fa fa-ellipsis-v fa-2x  pull-right" aria-hidden="true"></i>
          </div>
        </div>
        <!-- Heading End -->

        <!-- Message Box -->
        <div class="row message" id="conversation">

          <div class="row message-previous">
            <div class="col-sm-12 previous">
              <a onclick="previous(this)" id="ankitjain28" name="20">
              Show Previous Message!
              </a>
            </div>
          </div>

          <div class="row message-body">
            <div class="col-sm-12 message-main-receiver">
              <div class="receiver">
                <div class="message-text">
                 Hyy, Its Awesome..!
                </div>
                <span class="message-time pull-right">
                  Sun
                </span>
              </div>
            </div>
          </div>

          <div class="row message-body">
            <div class="col-sm-12 message-main-sender">
              <div class="sender">
                <div class="message-text">
                  Thanks n I know its awesome...!
                </div>
                <span class="message-time pull-right">
                  Sun
                </span>
              </div>
            </div>
          </div>
        </div>
        <!-- Message Box End -->

        <!-- Reply Box -->
        <div class="row reply">
          <div class="col-sm-1 col-xs-1 reply-emojis">
            <i class="fa fa-smile-o fa-2x"></i>
          </div>
          <div class="col-sm-9 col-xs-9 reply-main">
            <textarea class="form-control" rows="1" id="comment"></textarea>
          </div>
          <div class="col-sm-1 col-xs-1 reply-recording">
            <i class="fa fa-microphone fa-2x" aria-hidden="true"></i>
          </div>
          <div class="col-sm-1 col-xs-1 reply-send">
            <i class="fa fa-send fa-2x" aria-hidden="true"></i>
          </div>
        </div>
        <!-- Reply Box End -->
      </div>
      <!-- Conversation End -->
    </div>
    <!-- App One End -->
  </div>

  <!-- App End -->
  <script src="assets/js/bootstrap.min.js"></script>
  <script src="./assets/custom.js"></script>
</body>

</html>