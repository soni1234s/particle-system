import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'particle_component.dart';
import 'particle_painter.dart';

class ParticleScreen extends StatefulWidget {
  const ParticleScreen({super.key});

  static const routeName = '/';

  @override
  State<ParticleScreen> createState() => _ParticleScreenState();
}

class _ParticleScreenState extends State<ParticleScreen>
    with SingleTickerProviderStateMixin {
  late List<Particle> particles;
  late List<Particle> removedParticles;

  late Ticker _ticker;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    particles = List.generate(1, (index) => Particle());
    removedParticles = List.empty(growable: true);
    _ticker = createTicker((elapsed) {
      particles.add(Particle());

      for (var particle in removedParticles) {
        particles.remove(particle);
      }
      setState(() {});
    });
    _ticker.start();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: CustomPaint(
          painter: ParticlePainter(
              particles: particles, removedParticles: removedParticles),
        ),
      ),
    );
  }
}
