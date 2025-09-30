import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:lost_in_the_forest/actores/player.dart';

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

    final spawnPointsLayer = map.tileMap.getLayer<ObjectGroup>('spawnpoints');

    if (spawnPointsLayer != null) {
      for (final spawnPoint in spawnPointsLayer.objects ?? []) {
        switch (spawnPoint.class_) {
          case 'Player':
            final player = Player(
              position: Vector2(spawnPoint.x, spawnPoint.y),
            );
            add(player);
            break;
          default:
        }
      }
    }

    final collisionsLayers = map.tileMap.getLayer<ObjectGroup>('collisions');
    if (collisionsLayers != null) {
      for (final collision in collisionsLayers.objects) {
        switch (collision.class_) {
          case 'Tree':
            // final tree =
            break;
          default:
        }
      }
    }

    return super.onLoad();
  }
}
