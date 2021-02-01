package com.koreait.su;

public class BossSpeaker implements Speaker{
	private int maxSoundVolume;
	private int currentSoundVolume;
	
	public BossSpeaker() {
		maxSoundVolume =10;
		System.out.println("bossSound 생성");
	}
	
	public void soundPowerUp() {
		currentSoundVolume++;
	}
	
	public void soundPowerDown() {
		currentSoundVolume--;
	}

}
