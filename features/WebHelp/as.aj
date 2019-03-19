
public aspect as {
	final String featureName = "Sublinhado";
	
	after(): execution(void Main.createWebHelpBar()) {
		System.out.println("luana --------------------");
	}
	
}
