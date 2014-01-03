library DROID_AGE_CLIENT;

import "dart:html";
import "dart:async";

part "src/networking/droid_age_client.dart";
part "src/graphics/display.dart";
part "src/game.dart";

void main() {
	Game game = new Game();
	game.init();
	game.start();
}