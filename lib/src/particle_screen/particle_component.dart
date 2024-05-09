import '../../main.dart';

class Particle {
  double x = 0.5;
  double y = 0.9;

  int vx = doubleInRange(-4, 10);
  int vy = doubleInRange(-10, 0);

  int opacity = 255;

  Particle();

  void setPosition({required double dx, required double dy}) {
    if (x < 1 && y < 1) {
      x = dx;
      y = dy;
    }
  }

  void update() {
    x += vx;
    y += vy;

    opacity -= 3;
  }

  bool isFinished() => opacity == 0;
}
