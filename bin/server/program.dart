library DROID_AGE_SERVER;

import "dart:async";
import "dart:io";
import "../universal/src/world/world.dart";

part "src/networking/droid_age_server.dart";

void main() {
	DroidAgeServer server = new DroidAgeServer();
	
	server.initializeHttpRequests();
	server.initialize();
}
