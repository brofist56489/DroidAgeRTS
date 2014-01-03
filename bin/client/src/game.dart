part of DROID_AGE_CLIENT;

class Game {
	DroidAgeClient client;
	GameTimer timer;
	bool running = true;
	List<Point> points = new List<Point>();
	
	void init() {
		Display.init();
		client = new DroidAgeClient(this);
	}
	
	void start() {
		timer = new GameTimer(this);
		timer.start();
	}

	void tick() {
		
	}
	
	void render() {
		Display.renderRect(0, 0, Display.WIDTH, Display.HEIGHT, color: "black", fill: true);
		points.forEach((Point p) {
			Display.renderRect(p.x, p.y, 20, 20, color: "red", fill: true);
		});
	}
	
	void addPoint(int x, int y) {
		Point p = new Point(x, y);
		points.add(p);
	}
}

class GameTimer {
	int ltr = new DateTime.now().millisecondsSinceEpoch;
	int lt = new DateTime.now().millisecondsSinceEpoch;
	int now;
	double msPt = 60.0 / 1000.0;
	double delta = 0.0;
	
	int ticks = 0;
	int frames = 0;
	
	Game game; 
	GameTimer(Game game) {
		this.game = game;
	}
	
	void start() {
		window.requestAnimationFrame(update);
	}
	
	void update(double time) {
		now = new DateTime.now().millisecondsSinceEpoch;
		delta += (now - lt) * msPt;
		lt = now;
		
		while(delta >= 1) {
			game.tick();
			ticks++;
			delta--;	
		}
		
		game.render();
		frames++;
		
		if(now - ltr >= 1000.0) {
			print("$ticks tps, $frames fps");
			ticks = 0;
			frames = 0;
			ltr += 1000;
		}
		
		if(game.running)
			window.requestAnimationFrame(update);
	}
}