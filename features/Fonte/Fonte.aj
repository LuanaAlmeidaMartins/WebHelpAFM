import javafx.scene.control.ToggleGroup;

public aspect Fonte {
	
final String featureTamanho = "Tamanho";
final String featureName = "Fonte";
	
	after(): execution(void Main$$Tamanho.createWebHelpBar()) {
		Main.fonteSize = new SizeButton(featureTamanho);
		Main.fonteSize.actionButton();
	}
	
	after(): execution(void Main$$Cor.createWebHelpBar()) {
		Main.fonteColor = new ColorButton(featureName);
		Main.fonteColor.actionButton();
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
	
	after(): execution(void Main$$Fonte.createWebHelpBar()) {
		Main.fontFamily = new SizeButton(featureName);
		Main.fontFamily.actionButton();
	}
	
	after(SizeButton handle): target(handle) && call(private void teste(..)) {
		if (handle.getSizeButtonStatus().getButtonID().equals(featureTamanho)) {
			String[] tagStyle = handle.getSizeButtonStatus().getStyle().split(":");
			WebHelpBar.applyButtonStatus.removeFontStyle(tagStyle[0]);
			WebHelpBar.applyButtonStatus.setFontStyle("font-size: " + handle.getSizeButtonStatus().getStyle(),
					handle.getSizeButtonStatus().isActived());
		}
		
		if (handle.getSizeButtonStatus().getButtonID().equals(featureName)) {
		String[] tagStyle = handle.getSizeButtonStatus().getStyle().split(":");
		WebHelpBar.applyButtonStatus.removeFontStyle(tagStyle[0]);
		WebHelpBar.applyButtonStatus.setFontStyle(handle.getSizeButtonStatus().getStyle(),
				handle.getSizeButtonStatus().isActived());
		}
	}
}
