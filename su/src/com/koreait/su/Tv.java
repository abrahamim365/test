package com.koreait.su;

import java.util.Arrays;

public abstract class Tv {
	private int MaxChannel;
	private int MaxVolume;
	
	private int currentChannel;
	private int currentVolume;
	

	public Tv(int MaxChannel, int MaxVolume) {
		this.MaxChannel = MaxChannel;
		this.MaxVolume = MaxVolume;
	} 
	
	public void volumeup() {
		if (currentVolume < MaxVolume) {
			currentVolume++;
		}
	}
	
	public void volumedown() {
		if (currentVolume > 0) {
			currentVolume--;
		}
	}
	
	public String toString() {
		return String.format("CurrentVolume %d",currentVolume);
	}
}
