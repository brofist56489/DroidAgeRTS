
import "entities/Entity.dart";

class World {
	List<Entity> entities;
	
	void addEntity(Entity e) {
		entities.add(e);
	}
}