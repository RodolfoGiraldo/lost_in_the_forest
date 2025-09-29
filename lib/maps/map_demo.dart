import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:lost_in_the_forest/actores/players.dart';

class MapDemo extends World {
  late TiledComponent map;

  @override
  FutureOr<void> onLoad() async {
    map = await TiledComponent.load(
      'first_map.tmx',
      Vector2.all(16),
      // prefix: 'assets/tiles/',
    );

    add(map);
    add(Player());

    return super.onLoad();
  }
}
