import javafx.scene.canvas.GraphicsContext;
import javafx.scene.paint.Color;


public aspect Overlay {
	final String featureName = "Overlay";
	
	after(): execution(void Main$$Cor.createWebHelpBar()) {
		Main.overlay = new ColorButton(featureName);
		Main.overlay.actionButton();
	}
	
	after(ColorButton handle): target(handle) && call(private void setFeatureStyle(..)) {

		if (handle.getColorButtonStatus().getButtonID().equals(featureName)) {
			WebHelpBar.overlay.setVisible(true);
			GraphicsContext gc = WebHelpBar.overlay.getGraphicsContext2D();

			WebHelpBar.overlay.setOpacity(0.5);

			if (handle.getColorButtonStatus().isActive() == true) {
				gc.setFill(Color.color(handle.getColorButtonStatus().getColor().getRed(),
						handle.getColorButtonStatus().getColor().getGreen(),
						handle.getColorButtonStatus().getColor().getBlue()));
				gc.fillRect(0, -20, 1600, 700);
			} else {
				gc.clearRect(0, -20, 1600, 700);
			}
			gc.fill();
		}
	}
	
}
