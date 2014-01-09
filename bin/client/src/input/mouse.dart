part of DROID_AGE_CLIENT;

class Mouse {
	static List<bool> _buttons;
	static int _x = 0;
	static int _y = 0;
	
	static void init() {
		window.onMouseDown.listen(mouseDown);
		window.onMouseMove.listen(mouseMove);
	}
	
	static void mouseDown(MouseEvent e) {
		_buttons[e.button] = true;
	}
	
	static void mouseMove(MouseEvent e) {
		_x = e.page.x * (640 / window.innerWidth);
		_y = e.page.y * (480 / window.innerHeight);
	}
	
	static bool isPressed(int button) => _buttons[button];
	static Vector2 getPos() => new Vector2(_x, _y);
}