package com.koreait.su;

public class Tvtest {

	public static void main(String[] args) {
		
	
		Tv Lt = new LgTv();
		Tv St = new SamsungTv();
	
		Factory ft = new Factory(); 
		
		Tv LgTv = ft.makeTv(args[0]); 
		System.out.println(LgTv);	
		//객체화 한 변수는 출력할때 무조건 주소값이 나온다.
		 
		for (int i = 0; i < 20; i++) {
			Lt.volumeup();
		}
		System.out.println(Lt);
		
		for (int i = 0; i < 5; i++) {
			Lt.volumedown();
		}
		System.out.println(Lt);
	}

}
