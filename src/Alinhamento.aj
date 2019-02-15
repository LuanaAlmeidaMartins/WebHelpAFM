
public aspect Alinhamento {
	final String featureName = "Alinhamento";
	
	after(): execution(void Main.createWebHelpBar()) {
	}
	
	after(SimpleButton handle): target(handle) && call(private void applyStyle(..)) {
		if(handle.getSimpleButton().getButtonID().equals(featureName)) {
			WebHelpBar.applyButtonStatus.setFontStyle(handle.getSimpleButton().getStyle(),
					handle.getSimpleButton().isActive());
		}
	}
}
