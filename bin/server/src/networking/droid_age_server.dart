part of DROID_AGE_SERVER;

class DroidAgeServer {
	
	HttpServer httpServer;
	Stream webSocket;
	List<WebSocket> clients;

	DataParser parser;
	DroidAgeServer() {
		clients = new List<WebSocket>();
		parser = new DataParser();
	}

	void initializeHttpRequests() {
		HttpServer.bind(InternetAddress.ANY_IP_V6, 11010).then((HttpServer server) {
			this.httpServer = server;
			server.listen((HttpRequest request) {
				String path = request.uri.path;
				if(path == "/") path = "/index.html";
				if(path == "/favicon.ico") {
					request.response.statusCode = HttpStatus.NOT_FOUND;
					request.response.close();
					return;
				}
				path = "../client$path";
//				print(path);
		
				File file = new File(path);
				file.readAsString().then((String content) {
					request.response.write(content);
					request.response.close();
				});
			});
		});
	}
	
	void initialize() {
		HttpServer.bind(InternetAddress.ANY_IP_V6, 11011).then((HttpServer server) {
			Stream serv = server.transform(new WebSocketTransformer());
			this.webSocket = serv;
			serv.listen((WebSocket s) {
				print("New Connection. ${clients.length + 1} clients now");
				clients.add(s);
				s.listen((String e) {
					this.getParser().then((DataParser parser) {
						parser.parseData(e, this, s);
					});
				});
				
				send("0~20~20", s);
			});
		});
	}
	
	void send(String str, WebSocket socket) {
		socket.add(str);
	}
	
	void sendToAll(String str) {
		clients.forEach((WebSocket client) {
			send(str, client);
		});
	}
	
	Future<DataParser> getParser() {
		return new Future<DataParser>(() => this.parser);
	}
}

class DataParser {
	void parseData(String str, DroidAgeServer server, WebSocket socket) {
		print("Parsing $str");
	}
}