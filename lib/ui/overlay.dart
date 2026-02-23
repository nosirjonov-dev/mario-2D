import 'package:flutter/material.dart';
import '../game_manager.dart';

class HUD extends StatelessWidget {
  final GameManager game;
  const HUD({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 10,
          left: 10,
          child: Text('Score: ${game.score}', style: TextStyle(fontSize: 24, color: Colors.white)),
        ),
        Positioned(
          top: 40,
          left: 10,
          child: Text('Health: ${game.health}', style: TextStyle(fontSize: 24, color: Colors.red)),
        ),
      ],
    );
  }
}

class GameOver extends StatelessWidget {
  final GameManager game;
  const GameOver({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.black87,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('GAME OVER', style: TextStyle(fontSize: 40, color: Colors.red)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                game.overlays.remove('GameOver');
                game.health = 3;
                game.score = 0;
                game.resumeEngine();
              },
              child: Text('Restart'),
            ),
          ],
        ),
      ),
    );
  }
}