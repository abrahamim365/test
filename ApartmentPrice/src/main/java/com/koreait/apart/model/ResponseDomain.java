package com.koreait.apart.model;

import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlProperty;
import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlRootElement;


//response가 제일 큰 그릇 그안에 header와 body,items가 있음.
//body안에 items items안에 item으로 감싸고 전부다 들어있다.
@JacksonXmlRootElement(localName = "response")
public class ResponseDomain {
	
	@JacksonXmlProperty(localName="body")
	private BodyDomain body; //굳이 responseDomain 안 만들어도 BodyDomain된다.
	
	public BodyDomain getBody() {
		return body;
	}
	
	public void setBody(BodyDomain body) {
		this.body = body;
	} 
	
	
}

