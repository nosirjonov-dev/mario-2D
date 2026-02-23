import 'package:flame/components.dart';
import 'package:flame/collisions.dart';

class Coin extends SpriteComponent with CollisionCallbacks {
  Coin({required Vector2 position})
      : super(position: position, size: Vector2(30, 30), anchor: Anchor.center);

  @override
  Future<void> onLoad() async {
    add(RectangleHitbox());
  }
}