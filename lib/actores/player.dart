import 'dart:async';

import 'package:flame/components.dart';
import 'package:flutter/src/services/hardware_keyboard.dart';
import 'package:flutter/src/services/keyboard_key.g.dart';
import 'package:lost_in_the_forest/lost_in_the_forest.dart';
import 'package:lost_in_the_forest/utils/enums.dart';

class Player extends SpriteAnimationGroupComponent
    with HasGameRef<LostInTheForest>, KeyboardHandler {
  Player({super.position});

  late final SpriteAnimation idleAnimation;
  late final SpriteAnimation runUp;

  final double stepTime = 0.15;

  PlayerDirection playerDirection = PlayerDirection.none;
  double moveSpeed = 80;
  bool isFacingRight = true;

  Vector2 velocity = Vector2.zero();

  @override
  FutureOr<void> onLoad() {
    _loadAllAnimation();
    return super.onLoad();
  }

  @override
  void update(double dt) {
    _updatePlayerMovement(dt);
    super.update(dt);
  }

  @override
  bool onKeyEvent(KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    // final isLeftKeyPressed = keysPressed
    return super.onKeyEvent(event, keysPressed);
  }

  void _loadAllAnimation() {
    // Se crea la lista de animaciones
    animations = {
      PlayerState.idle: createAnimation(
        pathImageAnimation: 'cute_fantasy_free/Player/Player.png',
        amountImagesAnimation: 6,
        textureSize: Vector2(32, 32),
        texturePosition: Vector2(0, 0),
      ),
      PlayerState.movingDown: createAnimation(
        pathImageAnimation: 'cute_fantasy_free/Player/Player.png',
        amountImagesAnimation: 6,
        textureSize: Vector2(32, 32),
        texturePosition: Vector2(0, 96),
      ),
      PlayerState.movingRight: createAnimation(
        pathImageAnimation: 'cute_fantasy_free/Player/Player.png',
        amountImagesAnimation: 6,
        textureSize: Vector2(32, 32),
        texturePosition: Vector2(0, 128),
      ),
      PlayerState.movingUp: createAnimation(
        pathImageAnimation: 'cute_fantasy_free/Player/Player.png',
        amountImagesAnimation: 6,
        textureSize: Vector2(32, 32),
        texturePosition: Vector2(0, 160),
      ),
    };
  }

  void _updatePlayerMovement(double dt) {
    double dirX = 0.0;
    double dirY = 0.0;
    switch (playerDirection) {
      case PlayerDirection.none:
        // Se asigan una animacion en el momento
        current = PlayerState.idle;
        break;
      case PlayerDirection.left:
        // Se asigan una animacion en el momento
        if (isFacingRight) {
          flipHorizontallyAroundCenter();
          isFacingRight = false;
        }
        current = PlayerState.movingRight;
        dirX -= moveSpeed;
        break;
      case PlayerDirection.right:
        // Se asigan una animacion en el momento
        if (!isFacingRight) {
          flipHorizontallyAroundCenter();
          isFacingRight = true;
        }
        current = PlayerState.movingRight;
        dirX += moveSpeed;
        break;
      case PlayerDirection.up:
        // Se asigan una animacion en el momento
        current = PlayerState.movingUp;
        dirY -= moveSpeed;
        break;
      case PlayerDirection.down:
        // Se asigan una animacion en el momento
        current = PlayerState.movingDown;
        dirY += moveSpeed;
        break;
    }

    velocity = Vector2(dirX, dirY);
    position += velocity * (dt);
  }

  SpriteAnimation createAnimation({
    required String pathImageAnimation,
    required int amountImagesAnimation,
    required Vector2 textureSize,
    required Vector2 texturePosition,
  }) {
    return SpriteAnimation.fromFrameData(
      game.images.fromCache(pathImageAnimation),
      SpriteAnimationData.sequenced(
        amount: amountImagesAnimation,
        stepTime: stepTime,
        textureSize: textureSize,
        texturePosition: texturePosition,
      ),
    );
  }
}
