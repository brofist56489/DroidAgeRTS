part of DROID_AGE_CLIENT;

class DroidAgeClient {
	static const String HOST_IP = "ws://208.107.120.173:11011";

	WebSocket socket;
	DataParser parser;
	Game game;
	
	DroidAgeClient(Game this.game) {
		parser = new DataParser();
		socket = new WebSocket(HOST_IP);
		setup();
	}
	
	void setup() {
		socket.onMessage.listen((MessageEvent event) {
			getParser().then((DataParser parser) {
				parser.parse(event.data, this);
			});
		});
	}
	
	void send(String str) {
		socket.sendString(str);
	}
	
	void sendObject(SendableObject obj) {
		send(obj.encode());
	}
	
	Future<DataParser> getParser() {
		return new Future<DataParser>(() => this.parser);
	}
}

class DataParser {
	void parse(String str, DroidAgeClient client) {
		List<String> data = str.split("~");
		if(data[0] == "0") {
			print("Adding point");
			int posx = int.parse(data[1]);
			int posy = int.parse(data[2]);
			client.game.addPoint(posx, posy);
		}
	}
}

class SendableObject {
	String encode() => "";
}