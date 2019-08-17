import javafx.scene.canvas.GraphicsContext;
import javafx.scene.paint.Color;

public aspect Regua {
	final String featureName = "Regua";
	
	after(): execution(void Main$$Tamanho.createWebHelpBar()){
		Main.regua= new SizeButton(featureName);
	}
	
	after(SizeButton handle): target(handle) && call(private void teste(..)) {
		if (handle.getSizeButtonStatus().getButtonID().equals(featureName)) {
			WebHelpBar.overlay.setVisible(true);
			GraphicsContext gc = WebHelpBar.overlay.getGraphicsContext2D();
			double num = Double.parseDouble(handle.getSizeButtonStatus().getStyle());

			WebHelpBar.overlay.setOpacity(0.8);
			gc.setFill(Color.color(0.0, 0.0, 0.0));

			if (handle.getSizeButtonStatus().isActived() == true) {
				gc.fillRect(0, -20, 1600, 700);
				gc.clearRect(0, 80, 1600, num);
			} else {
				gc.clearRect(0, -20, 1600, 700);
			}
			gc.fill();
		}
	}
}
