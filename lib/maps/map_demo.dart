import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';

class MapDemo extends World {
  late TiledComponent map;

  @override
  FutureOr<void> onLoad() async {
    map = await TiledComponent.load(
      'first_map.tmx',
      Vector2.all(16),
      // prefix: '/tiles/',
    );

    add(map);

    return super.onLoad();
  }
}
