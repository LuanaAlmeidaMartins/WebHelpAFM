
public aspect Leitor {
final String featureName = "Leitor";
	
	after(): execution(void Main.createWebHelpBar()) {
	}
	
	after(SimpleButton handle): target(handle) && call(private void applyStyle(..)) {
		WebHelpBar.overlay.setVisible(false);
		new Synth();
		
	}
}
