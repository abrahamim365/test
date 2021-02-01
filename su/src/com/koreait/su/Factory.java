package com.koreait.su;

public class Factory {
	public Tv makeTv(String name) {
		switch(name) {
		case "Lg": 
			return new LgTv(); 
		case "Samsung": 
			return new SamsungTv();
		default:
		}
		return null;
	}
	
	public static Speaker makeSpeaker(String name) {
		switch(name) {
		case "Apple":
			return new AppleSpeaker();
		case "Boss":
			return new BossSpeaker();
		default:
		}
		return null;
	}
}
