import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:lost_in_the_forest/maps/map_demo.dart';

class LostInTheForest extends FlameGame {
  late final CameraComponent cameraComponent;
  final World world = MapDemo();
  @override
  Future<void> onLoad() async {
    // Loadall images into cache
    await images.loadAllImages();

    cameraComponent = CameraComponent(world: world);

    cameraComponent.viewfinder.anchor = Anchor.topLeft;

    addAll([cameraComponent, world]);

    await super.onLoad();
  }
}
