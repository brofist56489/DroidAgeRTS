part of DROID_AGE_CLIENT;

class Keyboard {
	static HashMap<int, int> _keys = new HashMap<int, int>();
	static HashMap<int, int> _onceKeys = new HashMap<int, int>();
	
	static void init() {
		window.onKeyDown.listen((KeyboardEvent e) {
			if(!_keys.containsKey(e.keyCode)) {
				_keys[e.keyCode] = e.timeStamp;
			}
			if(!_onceKeys.containsKey(e.keyCode)) {
				_onceKeys[e.keyCode] = e.timeStamp;
			}
		});
		
		window.onKeyUp.listen((KeyboardEvent e) {
			_keys.remove(e.keyCode);
			_onceKeys.remove(e.keyCode);
		});
	}
	
	static void poll() {
		_onceKeys.clear();
	}
	
	static bool isPressed(int kc) => _keys.containsKey(kc);
	static bool isPressedOnce(int kc) => _onceKeys.containsKey(kc);
}