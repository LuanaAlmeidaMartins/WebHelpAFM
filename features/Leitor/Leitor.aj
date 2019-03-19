
public aspect Leitor {
final String featureName = "Leitor";
	
	after(): execution(void Main.createWebHelpBar()) {
		SimpleButton botao = new SimpleButton(featureName);
		botao.action();
	}
	
	after(SimpleButton handle): target(handle) && call(private void applyStyle(..)) {
		WebHelpBar.overlay.setVisible(false);
		new Synth();
		
	}
}
