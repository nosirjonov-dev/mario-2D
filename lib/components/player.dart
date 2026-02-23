import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flame/collisions.dart';
import '../game_manager.dart';
import 'coin.dart';
import 'enemy.dart';
import 'package:flutter/services.dart';

class Player extends SpriteComponent with CollisionCallbacks, KeyboardHandler {
  final double speed = 200;
  final double jumpForce = 400;
  bool isGrounded = true;
  Vector2 velocity = Vector2.zero();

  @override
  Future<void> onLoad() async {
    size = Vector2(50, 50);
    anchor = Anchor.center;
    add(RectangleHitbox());
    position = Vector2(100, 300);
  }

  @override
  void update(double dt) {
    super.update(dt);

    // Gravity
    velocity.y += 800 * dt;

    // Movement
    position += velocity * dt;

    // Ground check
    if (position.y >= 300) {
      position.y = 300;
      velocity.y = 0;
      isGrounded = true;
    }
  }

  @override
  bool onKeyEvent(KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    if (keysPressed.contains(LogicalKeyboardKey.arrowRight)) {
      velocity.x = speed;
    } else if (keysPressed.contains(LogicalKeyboardKey.arrowLeft)) {
      velocity.x = -speed;
    } else {
      velocity.x = 0;
    }

    if (keysPressed.contains(LogicalKeyboardKey.space) && isGrounded) {
      velocity.y = -jumpForce;
      isGrounded = false;
    }

    return true;
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    final game = findGame() as GameManager;

    if (other is Coin) {
      game.addScore(10);
      other.removeFromParent();
    }

    if (other is Enemy) {
      game.takeDamage(1);
    }
  }
}