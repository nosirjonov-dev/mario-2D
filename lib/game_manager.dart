import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'components/player.dart';
import 'components/enemy.dart';
import 'components/coin.dart';
import 'components/ground.dart';

class GameManager extends FlameGame with HasCollisionDetection {
  late Player player;
  int score = 0;
  int health = 3;

  @override
  Future<void> onLoad() async {
    add(Ground());

    player = Player();
    add(player);

    add(Enemy(position: Vector2(400, 300)));
    add(Coin(position: Vector2(200, 300)));
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