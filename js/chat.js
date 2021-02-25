'use strict';
var usernamePage = document.querySelector('#username-page');
var chatPage = document.querySelector('#chat-page');
var usernameForm = document.querySelector('#usernameForm');
var messageForm = document.querySelector('#messageForm');
var messageInput = document.querySelector('#message');
var messageArea = document.querySelector('#messageArea');
var connectingElement = document.querySelector('.connecting');

var stompClient = null;
var username = null;

var colors = [
	'#2196F3', '#32c787', '#00BCD4', '#ff5652',
    '#ffc107', '#ff85af', '#FF9800', '#39bbb0'
]

function connect(event) {
	username = document.querySelector('#name').value.trim();
	
	if(username) {
		usernamePage.classList.add('hidden');
		chatPage.classList.remove('hidden');
		
		var socket = new SocketJS('/ws');
		stompClient = stomp.over(socket);
		
		stompClient.connect({}, onConnected, onError);
		// ~ (void) connect(headers, connectCallback, errorCallback)
		//onConnected - connect 콜백 함수
		//onError - error 콜백 함수
	}
	event.preventDefault();
	
}

function onConnected() {
	//Subscribe to the public Topic
	stompClient.subscribe('/topic/public', onMessageReceived);
	
	//Tell your username to the server
	stompClient.send("/app/chat.addUser",
		{},
		JSON.stringify({sender: username, type: 'JOIN'})
	)
	
	connectingElement.classList.add('hidden');
}


function onError(error) {
	connectingElement.textContent = 'Could not connect to WebSocket server.';
	connectingElement.style.color = 'red';
}

function sendMessage(event) {
	var messageContent = messageInput.value.trim();
	if(messageContent && stompClient) {
		var chatMessage = {
			sender: username,
			content: messageInput.value,
			type: 'CHAT'
		};
		stompClient.send("/app/chat.sendMessage", {}, JSON.stringify(chatMessage));
		messageInput.value = '';
	}
	event.preventDefault();
}

function onMessageReceived(payload) {
	var message = JSON.parse(payload.body);
	
	var messageElement = document.createElement('li');
	
	if(message.type === 'JSON') {
		messageElement.classList.add('event-message');
		message.content = message.sender + ' joined!';
	} else if (message.type === 'LEAVE') {
		messageElement.classList.add('event-message');
		message.content = message.sender + ' left!';
	} else {
		messageElement.classList.add('chat-message');
		
		var avatarElement = document.createElement('i');
		var avatarText = document.createTextNode(message.sender[0]);
		avatarElement.appendChild(avatarText);
		avatarElement.style['background-color'] = getAvatarColor(message.sender);
	
		messageElement.appendChild(avatarElement);
		
		var usernameElement = document.createElement('span');
		var usernameText = document.createTextNode(message.sender);
		usernameElement.appendChild(usernameText);
		messageElement.appendChild(usernameElement);
	}
	
	var textElement = document.createElement('p');
	var messageText = document.createTextNode(message.content);
	textElement.appendChild(messageText);
	
	messageElement.appendChild(textElement);
	
	messageArea.appendChild(messageElement);
	messageArea.scrollTop = messageArea.scrollHeight;
}

function getAvatarColor(messageSender) {
	var hash = 0;
	for(var i = 0; i <messageSender.length; i++) {
		hash = 31 * hash + messageSender.chatCodeAt(i);
	}
	var index = Math.abs(hash % colors.length);
	return colors[index];
}

usernameForm.addEventListener('submit', connect, true)
messageForm.addEventListener('submit',sendMessage, true)










/*var ws;

function wsOpen() {
	ws = new WebSocket("ws://" + location.host + "/chating")
	wsEvt();
}

function wsEvt() {
	ws.onopen = function(data) {
		//소켓이 열리면 초기화 세팅하기
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
					$(".me").append("<p class='chat_message'>" + d.msg + "</p>");
				} else {
					$(".others").append("<p class='chat_message'>" + d.msg + "</p>");
				}
			}
		}
	}

	document.addEventListener("keypress", function(e) {
		if (e.keyCode == 13) { //enter press
			send();
		}
	});
}

var sendBtnElem = document.querySelector('#sendBtn')
if (sendBtnElem) {
	sendBtnElem.addEventListener('click', function() {
		send()
	})

	function send() {
		var option = {
			type: "message",
			sessionId: $("#sessionId").val(),
			msg = $("#chatting").val()
		}
		ws.send(JSON.stringify(option))
		$('#chatting').val("");
	}
} */