import 'package:flutter/material.dart';
import 'package:particle_system/src/particle_screen/particle_screen.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      onGenerateRoute: (RouteSettings routeSettings) {
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) {
            switch (routeSettings.name) {
              case ParticleScreen.routeName:
                return const ParticleScreen();
              default:
                return const ParticleScreen();
            }
          },
        );
      },
    );
  }
}
