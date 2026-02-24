import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flame/collisions.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import '../game_manager.dart';
import 'coin.dart';
import 'enemy.dart';

class Player extends RectangleComponent
    with CollisionCallbacks, KeyboardHandler {

  final double speed = 200;
  final double jumpForce = 400;

  bool isGrounded = true;
  Vector2 velocity = Vector2.zero();

  Player()
      : super(
    size: Vector2(50, 50),
    paint: Paint()..color = Colors.blue,
  );

  @override
  Future<void> onLoad() async {
    anchor = Anchor.center;
    position = Vector2(100, 300);
    add(RectangleHitbox());
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

    // Horizontal movement
    if (keysPressed.contains(LogicalKeyboardKey.arrowRight)) {
      velocity.x = speed;
    } else if (keysPressed.contains(LogicalKeyboardKey.arrowLeft)) {
      velocity.x = -speed;
    } else {
      velocity.x = 0;
    }

    // Jump
    if (event is KeyDownEvent &&
        keysPressed.contains(LogicalKeyboardKey.space) &&
        isGrounded) {
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