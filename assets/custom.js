    $(".heading-compose").click(function() {
      $(".side-two").css({
        "left": "0"
      });
    });

    $(".newMessage-back").click(function() {
      $(".side-two").css({
        "left": "-100%"
      });
    });


    $(document).ready(function(){
      $("#comment").keyup(function(e){
        var code = e.keyCode ? e.keyCode : e.which;
        if (code == 13) {
          var self = $(this);
          var msg = $(this).val();
          var lead_id = $(".sideBar-body.active .details .lead_id").text();
          var user_id = $(".sideBar-body.active .details .user_id").text();
          var reciver_mobile = $(".sideBar-body.active .details .reciver_id").text();
          $.ajax({url: "api/index.php",method:'POST',data: {'message':msg,'user_id':user_id,'lead_id':lead_id,'receiver_id':reciver_mobile}, success: function(result){
            var msg_html = '<div class="row message-body"><div class="col-sm-12 message-main-sender"><div class="sender"><div class="message-text">'+msg+'</div><span class="message-time pull-right">Just Now</span></div></div></div>';
            $(".message").append(msg_html);
            self.val('');
          }});
        }
      });

      $(".sideBar-body").click(function(){
        $(".sideBar-body.active").removeClass('active');
        $(this).addClass('active');
        $('.conversation .heading-avatar .heading-avatar-icon img').attr('src',$(".sideBar-body.active .sideBar-avatar img").attr('src')); 
        $('.conversation .heading-name-meta').text($(".sideBar-body.active .sideBar-name .name-meta").text());
        get_recent_message();
        $('#comment').val('');
      });

      get_recent_message();
    });

    function get_recent_message(){
      var lead_id = $(".sideBar-body.active .details .lead_id").text();
      var user_id = $(".sideBar-body.active .details .user_id").text();
      $.ajax({url: "index.php",method:'POST',data: {'user_id':user_id,'lead_id':lead_id,'recent':true}, success: function(result){
        var msg = JSON.parse(result);
        if(!msg){
          $(".message").html('');
        }
        var msg_html = '';
        $.each( msg, function( key, value ) {
          if(value.status == 'send'){
            msg_html += '<div class="row message-body"><div class="col-sm-12 message-main-sender"><div class="sender"><div class="message-text">'+value.message+'</div><span class="message-time pull-right">'+value.created_at+'</span></div></div></div>';
          }else{
            msg_html += '<div class="row message-body"><div class="col-sm-12 message-main-receiver"><div class="receiver"><div class="message-text">'+value.message+'</div><span class="message-time pull-right">'+value.created_at+'</span></div></div></div>';
          }
        });
        $(".message").html(msg_html);
        ticker();
      }});
      $('#comment').val('');
    }

    function ticker(){
      setTimeout(function(){
        get_recent_message();
      },15000)
    }