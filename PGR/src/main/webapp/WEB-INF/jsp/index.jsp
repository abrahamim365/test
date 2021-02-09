<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
   <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
    <title>PJA</title>
    <!-- jquery -->
    <script src="js/jquery.min.js"></script>
    <!-- fullpage -->
    <link rel="stylesheet" type="text/css" href="css/fullpage.css">
    <script type="text/javascript" src="js/fullpage.js"></script>
    <!-- font awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
    <!-- css -->
    <link rel="stylesheet" type="text/css" href="css/header.css">
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <!-- js -->
    <script type="text/javascript" src="js/modal.js"></script>
    <script type="text/javascript" src="js/script.js"></script>
<style>
 @charset 'utf-8';
@import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Serif:wght@100;200;300;400;500;600;700&display=swap');

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    outline-style: none;
}

ul,
ol {
    list-style: none;
}

a {
    color: #333;
    text-decoration: none;
}

img {
    border: 0;
    vertical-align: middle;
}

html {
    font-size: 10px;
    user-select: none;
}

body {
    font-family: 'IBM Plex Serif', serif;
}

/*delete scroll*/
::-webkit-scrollbar {
    width: 0px;
}

.hidden {
    height: 100%;
    min-height: 100%;
    overflow: hidden !important;
}

/*show chat*/
#show_chat {
    position: fixed;
    bottom: 5%;
    right: 5%;
    width: 50px;
    height: 50px;
    display: block;
    border-radius: 50%;
    border: none;
    background-color: #333;
    color: #fff;
    z-index: 9999;
    cursor: pointer;
}

/*modal chat*/
.chat_container {
    display: none;
}

.chat_con {
    position: fixed;
    right: 0;
    bottom: 0;
    display: block;
    width: 300px;
    height: 400px;
    min-width: 390px;
    background: #FFF;
    margin: 20px 20px 20px 0;
    border: 1px solid #333;
    border-radius: 2px;
    font-family: tahoma, serif;
}

.titlebox {
    position: relative;
    display: flex;
    justify-content: center;
    align-items: center;
    width: 100%;
    height: 50px;
    margin-top: 20px;
    background: #fff;
    border-bottom: 1px solid #ccc;
    text-align: center;
    text-transform: uppercase;
}

.close_icon {
    position: relative;
    display: block;
    line-height: 35px;
    height: 100%;
    flex: 1;
}

#close_chat {
    cursor: pointer;
}

.titlebox>span {
    position: relative;
    display: block;
    line-height: 35px;
    height: 100%;
    font-size: 15px;
    flex: 2;
}

.chatbox {
    position: relative;
    display: block;
    width: 100%;
    height: 328px;
    background: #fff;
    padding: 15px;
}

.chatlogs::-webkit-scrollbar {
    width: 10px;
}

.chatlogs::-webkit-scrollbar-thumb {
    border-radius: 10px;
    background: #ccc;
}

.chatlogs {
    position: relative;
    display: block;
    padding: 10px;
    width: 100%;
    height: 225px;
    background: #fbfbfb;
    overflow-x: hidden;
    overflow-y: scroll;
}

.chat {
    position: relative;
    display: flex;
    flex-flow: row wrap;
    align-items: flex-start;
    margin-bottom: 10px;
}

.profile {
    position: relative;
    width: 30px;
    height: 30px;
    background: #ccc;
    border-radius: 50%;
}

.chat .chat_message {
    position: relative;
    width: 80%;
    padding: 10px;
    margin: 0 10px;
    color: #fff;
    font-size: 15px;
    border-radius: 10px;
}

.others .chat_message {
    background: #fc766aff;
}

.me .chat_message {
    background: #5b84b1ff;
    order: -1;
}

.chat_form {
    position: relative;
    display: flex;
    align-items: flex-start;
    margin-top: 10px;
}

.chat_form textarea {
    position: relative;
    background: #fbfbfb;
    width: 75%;
    height: 65px;
    border: 2px solid #ccc;
    resize: none;
    padding: 12px;
    font-size: 15px;
    font-family: 'Nanum Gothic', sans-serif;
    color: #333;
}

.chat_form textarea:focus {
    background: #fff;
}

.chat_form textarea::-webkit-scrollbar {
    width: 5px;
}

.chat_form textarea::-webkit-scrollbar-thumb {
    border-radius: 10px;
    background: #ccc;
}

.chat_form button {
    position: relative;
    background: #fc766aff;
    padding: 5px 15px;
    margin: 16px 10px;
    border-radius: 3px;
    font-size: 20px;
    color: #fff;
    border: none;
    box-shadow: 0 3px 0 #333;
    cursor: pointer;
    transition: background 0.2s;
    text-transform: capitalize;
}

.chat_form button:active {
    background: #fb4737;
}


/*wrap*/
.wrap {
    position: relative;
    display: block;
    height: 100%;
}

/*visual*/
.visual {
    position: relative;
    height: 100vh;
    width: 100vw;
}

/*content*/
.content {
    position: relative;
    display: block;
    height: 100vh;
    width: 100vw;
    z-index: 999999;
}

/*main*/
.main {
    position: relative;
    height: 100%;
    display: flex;
}

.main_left {
    position: relative;
    display: block;
    flex: 1;
    background: rgba(0, 0, 0, 0.3);
}

.main_mid {
    position: relative;
    display: block;
    flex: 1;
    background: rgba(0, 0, 0, 0.5);
}

.main_right {
    position: relative;
    display: block;
    flex: 1;
    background: rgba(0, 0, 0, 0.7);
}

/*footer*/
/*.footer {
    position: relative;
    display: block;
    height: 50px;
    background-color: #000;
    z-index: 99;
}*/

/* 반응형 코드 */
@media all and (max-width: 1024px) {
    .h_logo {
        font-size: 45px;
    }

}

@media all and (max-width: 960px) {
    .header {
        padding-top: 25px;
    }

    .h_logo {
        font-size: 40px;
    }

    .h_list li a {
        font-size: 15px;
    }

    input[type=button] {
        padding: 0 10px;
        margin-right: 10px;
        height: 25px;
    }
}

@media all and (max-width: 768px) {
    .h_login {
        width: 15%;
    }

    .login_container {
        display: block;
        left: 60%;
    }

    .h_logo {
        font-size: 37px;
    }

    input[type=button] {
        margin-right: 0;
        width: 68px;
    }

}

@media all and (max-width: 480px) {}
    </style>
</head>
<body>
    <div class="wrap">
        <!-- visual -->
        <div class="visual">
            <!-- visual_slide -->
            <div class="container">
            </div>
        </div>
        <!-- content -->
        <div class="content">
            <!-- header -->
            <div class="header">
                    <a href="#" class="h_logo" title="logo">
                        logo
                    </a>
                <div class="h_top">
                    <!-- 이미지넣을곳 -->
                    <img src="asset/h_top_img.jpg">
                </div>
                <div class="h_bot">
                    <ul class="h_list">
                        <li><a href="#">menu1</a></li>
                        <li><a href="#">menu2</a></li>
                        <li><a href="#">menu3</a></li>
                    </ul>
                    <div class="h_login">
                        <input type="button" name="" value="sign in">
                        <input type="button" name="" value="sign up">
                    </div>
                </div>
            </div>
            <!-- main -->
            <div class="main">
                <div class="main_left">
                </div>
                <div class="main_mid">
                </div>
                <div class="main_right">
                </div>
            </div>
            <div class="aside">
                <a href="/room"><input type="button" value="chatroom"></a>
            </div>
            <!-- footer -->
            <div class="footer">
            </div>
        </div>
    </div>
</body>

</html>