import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'game_manager.dart';
import 'ui/overlay.dart';

void main() {
  runApp(
    GameWidget(
      game: GameManager(),
      overlayBuilderMap: {
        'HUD': (BuildContext context, GameManager game) {
          return HUD(game: game);
        },
        'GameOver': (BuildContext context, GameManager game) {
          return GameOver(game: game);
        },
      },
      initialActiveOverlays: ['HUD'],
    ),
  );
}