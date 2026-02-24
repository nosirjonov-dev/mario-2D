import 'package:flame/components.dart';
import 'package:flame/collisions.dart';

class Enemy extends SpriteComponent with CollisionCallbacks {

  Vector2 startPosition;
  Vector2 endPosition;
  bool movingRight = true;

  Enemy({required Vector2 position})
      : startPosition = position.clone(),
        endPosition = Vector2(position.x + 100, position.y),
        super(
        position: position,
        size: Vector2(50, 50),
        anchor: Anchor.center,
      );

  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load('enemy.png'); // 🔥 MUHIM
    add(RectangleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);

    double speed = 100 * dt;

    if (movingRight) {
      position.x += speed;
      if (position.x >= endPosition.x) {
        movingRight = false;
      }
    } else {
      position.x -= speed;
      if (position.x <= startPosition.x) {
        movingRight = true;
      }
    }
  }
}