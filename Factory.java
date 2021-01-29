package Tv;

	public class Factory {
		public static Tv makeTv(String name) {
			switch(name) {
			case "lg":
				return new LgTV();
			case "samsung":
				return new SamsungTV();
			}
			return null; 
		} 
		
		public static Speaker makeSpeaker(String name) {
			//다양성때문에 speaker가 가능했다.
			switch(name) {
			case "boss":
				return new BossSpeaker();
			case "apple":
				return new AppleSpeaker();
			}
			return null;
		}
		
		
	}
	
	