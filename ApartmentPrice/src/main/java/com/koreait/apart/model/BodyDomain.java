package com.koreait.apart.model;

import java.util.List;

import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlProperty;
import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlRootElement;

@JacksonXmlRootElement(localName = "body")
public class BodyDomain {
	
	@JacksonXmlProperty(localName = "items")
	private List<ApartmentInfoEntity> items; //여러개 담을 수 있는 그릇 items
	
	public List<ApartmentInfoEntity> getItems() {
		return items;
	}
	
	public void setItems(List<ApartmentInfoEntity> items) {
		this.items = items;
	}
	
}
