import "dart:math" as Math;

class Vector2 {
	num _x;
	num _y;
	Vector2(num this._x, num this._y);
	
	int get x => _x;
	int get y => _y;
	
	operator+(Vector2 other) {
		return new Vector2(_x + other.x, _y + other.y);
	}
	operator-(Vector2 other) {
		return new Vector2(_x - other.x, _y - other.y);
	}
	operator*(Vector2 other) {
		return new Vector2(_x * other.x, _y * other.y);
	}
	operator/(Vector2 other) {
		return new Vector2(_x / other.x, _y / other.y);
	}
	num length() {
		return Math.sqrt(_x*_x+_y*_y);
	}
	void normal() {
		num l = length();
		_x /= l;
		_y /= l;
	}
	Vector2 normalize() {
		num l = length();
		num x = _x / l;
		num y = _y / l;
		return new Vector2(x, y);
	}
	Vector2 rotate(double radians, Vector2 center) {
		num dist = Vector2.dist(this, center);
		double ang = Math.atan2(_y - center.y, _x - center.x);
		ang += radians;
		num x = Math.cos(ang) * dist + center.x;
		num y = Math.sin(ang) * dist + center.y;
		return new Vector2(x, y);
	}
	Vector2 pointTo(Vector2 point, [num scale=1]) {
		return pointAway(point, scale) * new Vector2(-1, -1);
	}
	Vector2 pointAway(Vector2 point, [num scale=1]) {
		double ang = Math.atan2(_y - point.y, _x - point.x);
		num x = Math.cos(ang) * scale;
		num y = Math.sin(ang) * scale;
		return new Vector2(x, y);
	}
	
	static num dist(Vector2 p1, Vector2 p2) {
		Vector2 p3 = p1 - p2;
		return p3.length();
	}
} 