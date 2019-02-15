
public aspect Fonte {
	final String featureName = "Fonte", featureSecondName = "Tamanho";
	
	after(): execution(void Main.createWebHelpBar()) {
	}

	after(SizeButton handle): target(handle) && call(private void teste(..)) {
		if (handle.getSizeButtonStatus().getButtonID().equals(featureName)) {
			String[] tagStyle = handle.getSizeButtonStatus().getStyle().split(":");
			WebHelpBar.applyButtonStatus.removeFontStyle(tagStyle[0]);
			WebHelpBar.applyButtonStatus.setFontStyle(handle.getSizeButtonStatus().getStyle(),
					handle.getSizeButtonStatus().isActived());
		}
		if (handle.getSizeButtonStatus().getButtonID().equals(featureSecondName)) {
			String[] tagStyle = handle.getSizeButtonStatus().getStyle().split(":");
			WebHelpBar.applyButtonStatus.removeFontStyle(tagStyle[0]);
			WebHelpBar.applyButtonStatus.setFontStyle("font-size: " + handle.getSizeButtonStatus().getStyle(),
					handle.getSizeButtonStatus().isActived());
		}
		
	}
	
	after(ColorButton handle): target(handle) && call(private void setFeatureStyle(..)) {
		if (handle.getColorButtonStatus().getButtonID().equals(featureName)) {
			String tagStyle = "color: #";
			String colorName = new ConverterColorToString().converterColor(handle.getColorButtonStatus().getColor());
			WebHelpBar.applyButtonStatus.removeFontStyle(tagStyle);
			WebHelpBar.applyButtonStatus.setFontStyle(tagStyle + colorName + ";",
					handle.getColorButtonStatus().isActive());
			//WebHelpBar.applyButtonStatus.applyStyle();
		}
	}
	
}
