library DROID_AGE_CLIENT;

import "dart:html";
import "dart:collection";
import "dart:async";

import "../universal/src/math/vector2.dart";

part "src/networking/droid_age_client.dart";
part "src/graphics/display.dart";
part "src/input/mouse.dart";
part "src/input/keyboard.dart";
part "src/game.dart";

void main() {
	Game game = new Game();
	game.init();
	game.start();
}