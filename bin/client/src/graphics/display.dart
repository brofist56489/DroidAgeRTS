part of DROID_AGE_CLIENT;

class Display {
	static const int WIDTH = 640;
	static const int HEIGHT = 480;
	static CanvasElement canvas;
	static CanvasRenderingContext2D renderer;

	static int xOffset = 0;
	static int yOffset = 0;
	
	static void init() {
		canvas = querySelector("#targetCanvas");
		canvas.width = WIDTH;
		canvas.height = HEIGHT;
		renderer = canvas.getContext("2d");
	}
	
	static void renderRect(num x, num y, num w, num h, {String color : "white", bool fill : true}) {
		x -= xOffset;
		y -= yOffset;
	
		if(fill) {
			renderer.fillStyle = color;
			renderer.fillRect(x, y, w, h);
		} else {
			renderer.strokeStyle = color;
			renderer.strokeRect(x, y, w, h);
		}
	}
}