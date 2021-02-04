<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Chating</title>
<style>
* {
	margin: 0;
	padding: 0;
	ouline-style:none;
}

.container {
	width: 500px;
	margin: 0 auto;
	padding: 25px
}

.container h1 {
	font-size: 20px;
	padding: 15px 0;
	background: #F18C7E;
	color: white;
	text-align: center;
}

.chating {
	position: relative;
	display: block; 
	background-color: #fff;
	width: 500px;
	height: 500px;
	border: 1px solid black;
}

.msgContainer {
	position: relative; 
	display: block;
	width : 100%;
	height: 100%;
}

.textContainer {
	position: absolute;
	left:0;
	top:0;
	width:100%;
	height:10%;
}

.chating .msgContainer .me {
	position: relative;
	display:block;
	left: 0;
	top: 10%;
	width: 50%;
	height: 50px;
	color: #000;
	text-align: right;
	font-weight: bold;
	word-break: break-all;
	margin: 5px 0;
	border: 1px solid #888;
	padding: 10px;
	border-radius: 5px;
	background-color: #FCFCFC;
	color: #555;
	float:right;
}

.chating .msgContainer .others {
	position: relative;
	display:block;
	left: 0;
	top: 10%;
	width: 50%;
	height: 50px;
	color: #000;
	text-align: left;
	font-weight: bold;
	word-break: break-all;
	margin: 5px 0;
	border: 1px solid #888;
	padding: 10px;
	border-radius: 5px;
	background-color: #FCFCFC;
	color: #555;
	float:left;
	
}

.chat_form {
	position: relative;
	display: flex;
	align-items: flex-start;
	margin-top: 20px;
}

.chat_form textarea {
	position: relative;
	background: #fbfbfb;
	width: 75%;
	height: 50px;
	border: 2px solid #ccc;
	resize: none;
	padding: 12px;
	font-size: 18px;
	font-family: 'Nanum Gothic', sans-serif;
	color: #333;
}

.chat_form textarea:focus {
	background: #fff;
}

.chat_form textarea::-webkit-scrollbar {
	width: 10px;
}

.chat_form textarea::-webkit-scrollbar-thumb {
	border-radius: 10px;
	background: #ccc;
}

.chat_form button {
	position: relative;
	background: #fc766aff;
	padding: 5px 15px;
	margin: 0 10px;
	border-radius: 3px;
	font-size: 30px;
	color: #fff;
	border: none;
	box-shadow: 0 3px 0 #333;
	cursor: pointer;
	transition: background 0.2s;
	text-transform: capitalize;
}

.chat_form button:active {
	b
.input {
	width: 330px;
	height: 25px;
}

#yourMsg {
	display: flex;
}

</style>
</head>

<script type="text/javascript">
	var ws;

	function wsOpen() {
		//웹소켓 전송시 현재 방의 번호를 넘겨서 보낸다.
		ws = new WebSocket("ws://" + location.host + "/chating/"
				+ $("#roomNumber").val());
		wsEvt();
	}

	function wsEvt() {
		ws.onopen = function(data) {
			//소켓이 열리면 동작
		}

		ws.onmessage = function(data) {
			//메시지를 받으면 동작
			var msg = data.data;
			if (msg != null && msg.trim() != '') {
				var d = JSON.parse(msg);
				if (d.type == "getId") {
					var si = d.sessionId != null ? d.sessionId : "";
					if (si != '') {
						$("#sessionId").val(si);
					}
				} else if (d.type == "message") {
					if (d.sessionId == $("#sessionId").val()) {
						$(".textContainer").append(
								"<p class='me'>나 :" + d.msg + "</p>");
					} else {
						$("#chating").append(
								"<p class='others'>" + d.userName + " :"
										+ d.msg + "</p>");
					}

				} else {
					console.warn("unknown type!")
				}
			}
		}

		document.addEventListener("keypress", function(e) {
			if (e.keyCode == 13) { //enter press
				send();
			}
		});
	}

	function chatName() {
		var userName = $("#userName").val();
		if (userName == null || userName.trim() == "") {
			alert("사용자 이름을 입력해주세요.");
			$("#userName").focus();
		} else {
			wsOpen();
			$("#yourName").hide();
			$("#yourMsg").show();
		}
	}

	function send() {
		var option = {
			type : "message",
			roomNumber : $("#roomNumber").val(),
			sessionId : $("#sessionId").val(),
			userName : $("#userName").val(),
			msg : $("#chatting").val()
		}
		ws.send(JSON.stringify(option))
		$('#chatting').val("");
	}
</script>
<body>
	<div id="container" class="container">
		<h1>${roomName}의채팅방</h1>
		<input type="hidden" id="sessionId" value=""> <input
			type="hidden" id="roomNumber" value="${roomNumber}">

		<div id="chating" class="chating">
			<div class="msgContainer">
				<div class="textContainer"></div>
			</div>
		</div>
		
		<div id="yourName" >
			<table class="inputTable">
				<tr>
					<th>사용자명</th>
					<th><input type="text" name="userName" id="userName"></th>
					<th><button onclick="chatName()" id="startBtn">이름 등록</button></th>
				</tr>
			</table>
		</div>
		<div class ="chat_form">
		<div id="yourMsg" class="yourMsg">
			<table class="inputTable">
				<tr>
					<th>메시지</th>
					<th><textarea placeholder="보내실 메시지를 입력하세요." id="chatting"></textarea></th>
					<th><button onclick="send()" id="sendBtn">보내기</button></th>
				</tr>
			</table>
		</div>
		</div>
	</div>
</body>
</html>