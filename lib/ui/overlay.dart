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