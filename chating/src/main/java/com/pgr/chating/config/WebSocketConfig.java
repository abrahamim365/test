package com.pgr.chating.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;

@Configuration
@EnableWebSocketMessageBroker
public class WebSocketConfig implements WebSocketMessageBrokerConfigurer {
	//WebSocketMessageBrokerConfigurer 인터페이스는 websocket 연결을 구성하는 방법 중 일부에 대한 구현을 제공하는 데 사용된다.
	
	@Override
	public void registerStompEndpoints(StompEndpointRegistry registry) {
		registry.addEndpoint("/websocket").withSockJS();
	}
	
	//메소드는 클라이언트가 서버에 연결하는 데 사용할 웹 소켓 끝점을 등록하는 데 사용된다.
	
	@Override
	public void configureMessageBroker(MessageBrokerRegistry registry) {
		registry.enableSimpleBroker("/topic");
		registry.setApplicationDestinationPrefixes("/app");
	}
	
	//메소드 는 한 클라이언트에서 다른 클라이언트로 메시지를 라우팅하는 데 사용되는 메시지 브로커를 구성하는 데 사용된다.
}
