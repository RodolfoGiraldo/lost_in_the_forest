import 'dart:async';

import 'package:flame/components.dart';
import 'package:lost_in_the_forest/lost_in_the_forest.dart';

enum PlayerState { idle, running }

class Player extends SpriteAnimationGroupComponent
    with HasGameRef<LostInTheForest> {
  late final SpriteAnimation idleAnimation;
  final double stepTime = 0.05;

  @override
  FutureOr<void> onLoad() {
    _loadAllAnimation();
    return super.onLoad();
  }

  void _loadAllAnimation() {
    idleAnimation = SpriteAnimation.fromFrameData(
      game.images.fromCache('cute_fantasy_free/Player/Player.png'),
      SpriteAnimationData.sequenced(
        amount: 6,
        stepTime: stepTime,
        textureSize: Vector2.all(16),
      ),
    );

    // Se crea la lista de animaciones
    animations = {PlayerState.idle: idleAnimation};

    // Se asigan una animacion en el momento
    current = PlayerState.idle;
  }
}
