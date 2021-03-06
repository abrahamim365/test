<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
    <title>PJA</title>
    <!-- jquery -->
    <script src="/js/jquery.min.js"></script>
    <!-- fullpage -->
    <link rel="stylesheet" type="text/css" href="/css/fullpage.css">
    <script type="text/javascript" src="/js/fullpage.js"></script>
    <!-- font awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
    <!-- css -->
    <link rel="stylesheet" type="text/css" href="/css/header.css">
    <link rel="stylesheet" type="text/css" href="/css/main.css">
    <!-- js -->
    <script type="text/javascript" src="/js/modal.js"></script>
    <script type="text/javascript" src="/js/script.js"></script>
</head>

<body>
    <!-- show chat -->
    <button id="show_chat">+</button>
    <!-- modal chat -->
    <div class="chat_container">
        <div class="chat_con">
            <div class="titlebox">
                <div class="close_icon">
                    <i class="far fa-times-circle fa-3x" id="close_chat"></i>
                </div>
                
                <span>chatting room</span>
                <input type="hidden" id="sessionId" value=""> 
            </div>
            <div class="chatbox">
                <div class="chatlogs">
                	<div class="chat"></div>
                </div>
                
                <div class="chat_form">
                    <textarea id="chatting"></textarea>
                    <button onclick="send()" id="sendBtn">send</button>
                </div>
                
            </div>
        </div>
    </div>
    <!-- header -->
    <div class="header">
        <a href="#" class="h_logo" title="logo">logo</a>
        <ul class="h_list">
            <li><a href="#">menu1</a></li>
            <li><a href="#">menu2</a></li>
            <li><a href="#">menu3</a></li>
            <li><a href="#">menu4</a></li>
        </ul>
        <div class="h_login">
            <div class="login_container">
                <input type="button" name="" value="sign in">
                <input type="button" name="" value="sign up">
            </div>
        </div>
    </div>
    <div class="wrap" id="fullpage">
        <!-- visual -->
        <div class="visual section">
            <!-- visual_slide -->
            <div class="slide" style="background: rgba(0,0,0,0.1);"></div>
            <div class="slide" style="background: rgba(0,0,0,0.3);"></div>
            <div class="slide" style="background: rgba(0,0,0,0.5);"></div>
            <div class="slide" style="background: rgba(0,0,0,0.7);"></div>
        </div>
        <!-- content -->
        <div class="content section">
            <!-- main -->
            <div class="main">
                <div class="main_left">
                </div>
                <div class="main_mid">
                </div>
                <div class="main_right">
                </div>
            </div>
        </div>
    </div>
</body>

</html>