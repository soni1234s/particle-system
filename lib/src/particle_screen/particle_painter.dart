import 'package:flutter/material.dart';

import 'particle_component.dart';

class ParticlePainter extends CustomPainter {
  List<Particle> particles;
  List<Particle> removedParticles;

  ParticlePainter({required this.particles, required this.removedParticles});

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint

    for (var particle in particles) {
      double x = particle.x * size.width;
      double y = particle.y * size.height;

      particle.setPosition(dx: x, dy: y);
      particle.update();
      canvas.drawCircle(
          Offset(particle.x, particle.y),
          15,
          Paint()
            ..color = Color.fromARGB(particle.opacity, 255 * particle.x.toInt(),
                255 * particle.y.toInt(), 255 * particle.y.toInt()));

      if (particle.isFinished()) {
        removedParticles.add(particle);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
