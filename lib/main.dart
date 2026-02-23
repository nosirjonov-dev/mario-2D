import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'game_manager.dart';

void main() {
  runApp(
    GameWidget(
      game: GameManager(),
    ),
  );
}