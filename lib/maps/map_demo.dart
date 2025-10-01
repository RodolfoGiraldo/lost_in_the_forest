import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:lost_in_the_forest/actores/player.dart';
import 'package:lost_in_the_forest/collision_block.dart';

class MapDemo extends World {
  late TiledComponent map;
  List<CollisionBlock> collisionsBlocks = [];
  late Player player;

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
      for (final spawnPoint in spawnPointsLayer.objects) {
        switch (spawnPoint.class_) {
          case 'Player':
            player = Player(position: Vector2(spawnPoint.x, spawnPoint.y));
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
          case 'Arbol':
            final tree = CollisionBlock(
              position: Vector2(collision.x, collision.y),
              size: Vector2(collision.width, collision.height),
              isTree: true,
            );
            collisionsBlocks.add(tree);
            add(tree);
            break;
          case 'Cofre':
            final cofre = CollisionBlock(
              position: Vector2(collision.x, collision.y),
              size: Vector2(collision.width, collision.height),
              isCofre: true,
            );
            collisionsBlocks.add(cofre);
            add(cofre);
            break;
          case 'Cerdo':
            final cerdo = CollisionBlock(
              position: Vector2(collision.x, collision.y),
              size: Vector2(collision.width, collision.height),
              isCerdo: true,
            );
            collisionsBlocks.add(cerdo);
            add(cerdo);
            break;
          case 'Roca':
            final roca = CollisionBlock(
              position: Vector2(collision.x, collision.y),
              size: Vector2(collision.width, collision.height),
              isRoca: true,
            );
            collisionsBlocks.add(roca);
            add(roca);
            break;
          case 'Oveja':
            final oveja = CollisionBlock(
              position: Vector2(collision.x, collision.y),
              size: Vector2(collision.width, collision.height),
              isOveja: true,
            );
            collisionsBlocks.add(oveja);
            add(oveja);
            break;
          default:
        }
      }

      player.collisionsBlocks = collisionsBlocks;
    }

    return super.onLoad();
  }
}
