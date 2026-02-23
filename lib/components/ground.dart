import 'package:flame/components.dart';
import 'package:flame/collisions.dart';

class Ground extends PositionComponent with CollisionCallbacks {
  @override
  Future<void> onLoad() async {
    position = Vector2(0, 350);
    size = Vector2(800, 50);
    add(RectangleHitbox());
  }
}