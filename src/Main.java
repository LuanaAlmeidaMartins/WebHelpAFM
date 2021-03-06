
import java.io.File;
import javafx.geometry.Insets;

import javafx.application.Application;
import javafx.scene.Group;
import javafx.scene.Scene;
import javafx.scene.control.ScrollPane;
import javafx.scene.image.Image;
import javafx.scene.layout.VBox;
import javafx.scene.web.WebEngine;
import javafx.scene.web.WebView;
import javafx.stage.Stage;
import javafx.scene.canvas.Canvas;

import javafx.scene.layout.StackPane;



abstract class Main$$WebHelp extends Application {

	@SuppressWarnings("static-access")
	@Override
	public void start (final Stage stage ) {
		
		//Set application icon
		File file = new File("icons/webhelp.png");
		Image image = new Image(file.toURI().toString());
		stage.getIcons().add(image);
		
		//Set application home page
		String homePageUrl = "https://www.w3.org/TR/DOM-Level-2-Core/core.html#ID-F68F082";

		//Create opcaoTamanho WebView
		final WebView browser = new WebView();
		browser.setStyle("fx-padding:100;");
		
		// Get WebEngine via WebView and load home page
		final WebEngine webEngine = browser.getEngine();
		webEngine.load(homePageUrl);
		
		
		//When the website content is bigger than display area, the scroll pane is enabled
		ScrollPane scrollPane = new ScrollPane();
		scrollPane.setContent(new Group());
		
		//Create the navigation bar
		//NavigationBar navigationBar = new NavigationBar(browser, homePageUrl);

		Canvas canvas = new Canvas(1300,600);
		canvas.setStyle("-fx-padding: 0, 0, 0, 0;");
		
		// Create the WebHelpDyslexia bar
		WebHelpBar webHelpBar = new WebHelpBar(browser, canvas);
		 
		StackPane stack = new StackPane();
	    stack.getChildren().addAll(browser, canvas);
	    stack.setMargin(browser, new Insets(12, 12, 10, 28));

	    new Main().createWebHelpBar();

		//Create the VBox, add the navigation, menu and webview to the VBox and
		VBox root = new VBox(webHelpBar, stack);
		//navigationBar,
		
		//Create the Scene, add the Scene to the Stage and display the Stage
		Scene scene = new Scene(root, 1600,900);
		stage.setScene(scene);

		stage.show();
 }

	public static void main(String[] args) {
		launch(args);
	}

	public void createWebHelpBar() {
		System.out.println("mains");
		
	}
}


abstract class Main$$Tamanho extends  Main$$WebHelp  {
	
	SizeButton regua = null, paragrafos = null, fonteSize=null;
	SizeButton  linhas = null, caracteres =null, fontFamily = null;
	
	public void createWebHelpBar() {
		super.createWebHelpBar() ;
	}

}

/**
 * TODO description
 */
abstract class Main$$Pequeno extends  Main$$Tamanho  {
	
	public void createWebHelpBar() {
		super.createWebHelpBar() ;
		
		if(caracteres!=null) {
			caracteres.opcao("Pequeno");
			caracteres.actionButton() ;
		}
		if(paragrafos!=null) {
			paragrafos.opcao("Pequeno");
			paragrafos.actionButton() ;
		}
		if(linhas!=null) {
			linhas.opcao("Pequeno");
			linhas.actionButton() ;
		}
		if(fonteSize!=null) {
			fonteSize.opcao("Pequeno");
			fonteSize.actionButton() ;
		}
		if(regua!=null) {
			regua.opcao("Pequeno");
			regua.actionButton() ;
		}
	}

}

abstract class Main$$Medio extends  Main$$Pequeno  {
	
	public void createWebHelpBar() {
		super.createWebHelpBar() ;
		
		if(caracteres!=null) {
			caracteres.opcao("Medio");
			caracteres.actionButton() ;
		}
		if(paragrafos!=null) {
			paragrafos.opcao("Medio");
			paragrafos.actionButton() ;
		}
		if(linhas!=null) {
			linhas.opcao("Medio");
			linhas.actionButton() ;
		}
		if(fonteSize!=null) {
			fonteSize.opcao("Medio");
			fonteSize.actionButton() ;
		}
		if(regua!=null) {
			regua.opcao("Medio");
			regua.actionButton() ;
		}
	}

}

abstract class Main$$Grande extends  Main$$Medio  {
	
	public void createWebHelpBar() {
		super.createWebHelpBar() ;
		
		if(caracteres!=null) {
			caracteres.opcao("Grande");
			caracteres.actionButton() ;
		}
		
		if(paragrafos!=null) {
			paragrafos.opcao("Grande");
			paragrafos.actionButton() ;
		}
		
		if(linhas!=null) {
			linhas.opcao("Grande");
			linhas.actionButton() ;
		}
		
		if(fonteSize!=null) {
			fonteSize.opcao("Grande");
			fonteSize.actionButton() ;
		}
		if(regua!=null) {
			regua.opcao("Grande");
			regua.actionButton() ;
		}
	}

}

abstract class Main$$Enorme extends  Main$$Grande  {
	
	public void createWebHelpBar() {
		super.createWebHelpBar() ;
		
		if(caracteres!=null) {
			caracteres.opcao("Enorme");
			caracteres.actionButton() ;
		}
		
		if(paragrafos!=null) {
			paragrafos.opcao("Enorme");
			paragrafos.actionButton() ;
		}
		
		if(linhas!=null) {
			linhas.opcao("Enorme");
			linhas.actionButton() ;
		}
		
		if(fonteSize!=null) {
			fonteSize.opcao("Enorme");
			fonteSize.actionButton() ;
		}
		
		if(regua!=null) {
			regua.opcao("Enorme");
			regua.actionButton() ;
		}
	}

}


abstract class Main$$Cor extends  Main$$Enorme  {
	
	ColorButton background = null, fonteColor=null, highlight=null, overlay = null;
	
	public void createWebHelpBar() {
		super.createWebHelpBar() ;
	}

}


abstract class Main$$Overlay extends  Main$$Cor  {
	public void createWebHelpBar() {
		overlay = new ColorButton("Overlay");
		overlay.actionButton();
		super.createWebHelpBar() ;
	}
}

/**
 * TODO description
 */
abstract class Main$$Regua extends  Main$$Overlay  {
	public void createWebHelpBar() {
		System.out.println("regua main");
		regua = new SizeButton("Regua");
		super.createWebHelpBar() ;
	}
}

/**
 * TODO description
 */
abstract class Main$$Background extends  Main$$Regua  {

	public void createWebHelpBar() {
		background = new ColorButton("Background");
		background.actionButton();
		super.createWebHelpBar() ;
	}
}

/**
 * TODO description
 */
abstract class Main$$Fonte extends  Main$$Background  {

	public void createWebHelpBar() {
		fonteColor = new ColorButton("Fonte");
		fonteColor.actionButton();
		
		fonteSize = new SizeButton("Tamanho");
		fontFamily = new SizeButton("Fonte");
		super.createWebHelpBar() ;
	}
}

/**
 * TODO description
 */
abstract class Main$$OpenSans extends  Main$$Fonte  {
	public void createWebHelpBar() {
		super.createWebHelpBar() ;

		if(fontFamily!=null) {
			fontFamily.opcao("OpenSans");
			fontFamily.actionButton() ;
		}
	}
}

/**
 * TODO description
 */
abstract class Main$$ComicSans extends  Main$$OpenSans  {
	public void createWebHelpBar() {
		super.createWebHelpBar() ;

		if(fontFamily!=null) {
			fontFamily.opcao("ComicSans");
			fontFamily.actionButton() ;
		}
	}
}

/**
 * TODO description
 */
abstract class Main$$Georgia extends  Main$$ComicSans  {
	public void createWebHelpBar() {
		super.createWebHelpBar() ;

		if(fontFamily!=null) {
			fontFamily.opcao("Georgia");
			fontFamily.actionButton() ;
		}
	}
}

/**
 * TODO description
 */
abstract class Main$$OpenDyslexic extends  Main$$Georgia  {
	public void createWebHelpBar() {
		super.createWebHelpBar() ;
		
		if(fontFamily!=null) {
			fontFamily.opcao("OpenDyslexic");
			fontFamily.actionButton() ;
		}
	}

}


abstract class Main$$Highlight extends  Main$$OpenDyslexic  {
	public void createWebHelpBar() {
		highlight = new ColorButton("Highlight");
		highlight.actionButton();
		super.createWebHelpBar() ;
	}
}

/**
 * TODO description
 */
abstract class Main$$Linhas extends  Main$$Highlight  {
	public void createWebHelpBar() {
		linhas = new SizeButton("Linhas");
		super.createWebHelpBar() ;
	}
}


abstract class Main$$Italico extends  Main$$Linhas  {
	public void createWebHelpBar() {
		super.createWebHelpBar() ;
		SimpleButton a = new SimpleButton ("Italico");
		a.action () ;
	}
}


abstract class Main$$Sublinhado extends  Main$$Italico  {

	public void createWebHelpBar() {
		super.createWebHelpBar() ;
		SimpleButton botao = new SimpleButton("Sublinhado");
		botao.action();
	}
}


abstract class Main$$Negrito extends  Main$$Sublinhado  {
	public void createWebHelpBar() {
		super.createWebHelpBar() ;
		SimpleButton botao = new SimpleButton("Negrito");
		botao.action();
	}
}


abstract class Main$$Paragrafos extends  Main$$Negrito  {
	public void createWebHelpBar() {
		paragrafos = new SizeButton("Paragrafos");
		super.createWebHelpBar() ;
	}
}


public class Main extends  Main$$Paragrafos  {
	
	public void createWebHelpBar() {
		caracteres = new SizeButton("Caracteres");
		super.createWebHelpBar() ;
	}
}