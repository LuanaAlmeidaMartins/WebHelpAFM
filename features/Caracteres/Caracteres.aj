
public aspect Caracteres {
	final String featureName = "Caracteres";
		
	after(): execution(void Main.createWebHelpBar()) {
	}
		
	after(SizeButton handle): target(handle) && call(private void teste(..)) {
		if (handle.getSizeButtonStatus().getButtonID().equals(featureName)) {
			String[] tagStyle = handle.getSizeButtonStatus().getStyle().split(":");
			WebHelpBar.applyButtonStatus.removeFontStyle(tagStyle[0]);
			WebHelpBar.applyButtonStatus.setFontStyle(handle.getSizeButtonStatus().getStyle(),
					handle.getSizeButtonStatus().isActived());
		}
	}
}
