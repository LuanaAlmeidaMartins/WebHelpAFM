
public aspect Background {
	final String featureName = "Background";
	
	after(): execution(void Main.createWebHelpBar()) {
	}
	
	after(ColorButton handle): target(handle) && call(private void setFeatureStyle(..)) {
		if (handle.getColorButtonStatus().getButtonID().equals(featureName)) {
			String tagStyle = "background: #";
			String colorName = new ConverterColorToString().converterColor(handle.getColorButtonStatus().getColor());
			WebHelpBar.applyButtonStatus.removeFontStyle(tagStyle);
			WebHelpBar.applyButtonStatus.setFontStyle(tagStyle + colorName + ";", 
					handle.getColorButtonStatus().isActive());
		}
	}
}
