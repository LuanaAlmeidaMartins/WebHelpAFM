public aspect Highlight {
	final String featureName = "Highlight";
	
	after(): execution(void Main$$Cor.createWebHelpBar()) {
		Main.highlight = new ColorButton(featureName);
		Main.highlight.actionButton();
	}
	
	after(ColorButton handle): target(handle) && call(private void setFeatureStyle(..)) {

		if (handle.getColorButtonStatus().getButtonID().equals(featureName)) {
			WebHelpBar.overlay.setVisible(false);
			String colorName = new ConverterColorToString().converterColor(handle.getColorButtonStatus().getColor());
			WebHelpBar.webEngine.executeScript("var selection = window.getSelection();"
					+ "var range = selection.getRangeAt(0);" + "var newNode = document.createElement(\"span\");"
					+ "newNode.setAttribute(\"style\", \"background-color: #" + colorName + ";\");"
					+ "range.surroundContents(newNode); ");
		}
	}
}
