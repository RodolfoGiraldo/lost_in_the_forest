import 'package:flame/components.dart';

class CollisionBlock extends PositionComponent {
  CollisionBlock({
    this.isCofre = false,
    this.isTree = false,
    this.isCerdo = false,
    this.isOveja = false,
    this.isRoca = false,
    super.position,
    super.size,
  }) {}

  bool isTree;
  bool isCofre;
  bool isCerdo;
  bool isRoca;
  bool isOveja;
}
