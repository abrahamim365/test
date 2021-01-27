package com.koreait.su;

public abstract class TV { //abstract를 붙임 -> 객체화 금지
	private int maxChannel;
	private int maxVolume;
	
	private int currentChannel;
	private int currentVolume;	
	private Speaker speaker; //직접적인 연결 -> 수정이 많이 필요하다.
	
	public TV(int maxChannel, int maxVolume) {
		this.maxChannel = maxChannel;
		this.maxVolume = maxVolume; //.은 맴버필드나 메소드를 호출할 떄 쓴다.
//		this.speaker = new BossSpeaker();
//		this.speaker = new AppleSpeaker(); //정방향이 되기때문에 이렇게 쓰지 않는다.
		
		//IoC -> Inversion of Controll
		// TV -> Speaker -> ... -> ... 의 과정이 일반적
		// ... -> ... -> Speaker -> TV 로 과정을 하는 것 : IoC구조
	}
	
	public void setSpeaker(Speaker speaker) {
		this.speaker = speaker; //nullpoint error가 뜸
	}
	
	public TV() {
		//super(); 가 생략되어 있다.
	}
	
	public void volumeUp() {
		//올리는것 구현
		if(maxVolume > currentVolume) {
			currentVolume ++;
			speaker.soundPowerUp();
		}
	}
	
	public void volumeDown() {
		if(currentVolume > 0) {
			currentVolume --;
			speaker.soundPowerDown();
		}
	}
	
	@Override
	public String toString() { //별 의미없는 default값이지만 주소값을 overriding 하여서 콘솔에 찍히는 값을 바꿔줄 수가 있다.
		return String.format("volume: %d",currentVolume);
	}
}
