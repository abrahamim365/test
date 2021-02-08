package var;

public class sum {
	int x=0;
	int y=0;
	
	public static int setsum(int x, int y) {
		sum s = new sum();
		int s1 = s.x+ s.y;
		return s1;
	}
	
	public static void getsum() {
		sum s = new sum();
		System.out.println(s.x + s.y);
	}
}
