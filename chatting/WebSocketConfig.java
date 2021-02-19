package com.pgr.chatting;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;

@Configuration
@EnableWebSocketMessageBroker //WebSocket서버 활성화
public class WebSocketConfig implements WebSocketMessageBrokerConfigurer{ //웹 소켓 연결을 구성하기 위한 메서드를 구현
	
	@Autowired
	SocketHandler socketHandler;
	
	/*클라이언트가 웹 소켓 서버에 연결하는 데 사용할 웹 소켓 엔드 포인터를 등록한다.*/
	@Override 
	public void registerStompEndpoints(StompEndpointRegistry registry) {
		registry.addEndpoint("/ws").withSockJS();
	//SockJS는 웹 소켓을 지원하지 않는 브라우저에 폴백 옵션을 활성화하는데 사용한다.
	//Fallback : 어떤 기능이 약해지거나 제대로 동작하지 않을 때, 이에 대처하는 기능
	//STOMP:특정 주제를 구독한 사용자에게만 메시지를 보내는 방법 또는 특정 사용자에게 메시지를 보내는 방법과 같은 내용은 정의하지 않는다. 이러한 기능을 위해서 STOMP가 필요하다.
	
	}
	
	/*한 클라이언트에서 다른 클라이언트로 메시지를 라우팅 하는 데 사용될 메시지 브로커를 구성한다.*/
	@Override
	public void configureMessageBroker(MessageBrokerRegistry registry) {
		registry.setApplicationDestinationPrefixes("/app"); //"/app" 시작되는 메시지가 message-handling methods으로 라우팅 되어야 한다.
		registry.enableSimpleBroker("/topic"); //"/topic" 시작되는 메시지가 메시지 브로커로 라우팅 되도록 정의한다. 메시지 브로커는 특정 주제를 구독 한 연결된 모든 클라이언트에게 메시지를 broadcast한다.
		
	}
}
