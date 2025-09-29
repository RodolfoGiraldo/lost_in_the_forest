import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lost_in_the_forest/lost_in_the_forest.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Flame.device.fullScreen();
  Flame.device.setLandscape();

  final LostInTheForest lostInTheForestGame = LostInTheForest();

  runApp(
    GameWidget(game: kDebugMode ? LostInTheForest() : lostInTheForestGame),
  );
}
