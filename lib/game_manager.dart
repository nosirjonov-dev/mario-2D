import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'components/player.dart';
import 'components/enemy.dart';
import 'components/coin.dart';
import 'components/ground.dart';
import 'ui/overlay.dart';

class GameManager extends FlameGame with HasCollisionDetection {
  late Player player;
  int score = 0;
  int health = 3;

  @override
  Future<void> onLoad() async {
    // Background
    add(Ground());

    // Player
    player = Player();
    add(player);

    // Enemy
    add(Enemy(position: Vector2(400, 300)));

    // Coin
    add(Coin(position: Vector2(200, 300)));

    // Overlay UI
    overlays.add('HUD');
  }

  void addScore(int value) {
    score += value;
  }

  void takeDamage(int value) {
    health -= value;
    if (health <= 0) {
      overlays.add('GameOver');
      pauseEngine();
    }
  }
}