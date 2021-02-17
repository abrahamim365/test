
function wsOpen() {
	var ws = new WebSocket("ws://" + location.host + "/chating")
	wsEvt();
}

	function wsEvt() {
		ws.onopen = function(data){
			
		}

		ws.onmessage = function(data) {
		var msg = data.data;
		if(msg != null && msg.trim() != '') {
			var d = JSON.parse(msg);
			if(d.type == "getId") {
				var si = d.sessionId != null ? d.sessionId : "";
				if(si != '') {
					$("#sessionId").val(si);
				}
		} else if(d.type == "message") {
			if(d.sessionId == $("#sessionId").val()) {
				$("chat_message").append("<p class='me'>" + d.msg + "</p>");
			} else {
				$("chat_message").append("<p class='others'>" + d.msg +"</p>");
			}
		}
	}
}			
	
	document.addEventListener("keypress", function(e){
		if(e.keyCode == 13){ //enter press
			send();
		}
	});
}

var sendBtnElem = document.querySelector('#sendBtn')
if(sendBtnElem) {
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
}