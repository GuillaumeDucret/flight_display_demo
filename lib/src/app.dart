import 'package:flutter/material.dart';

import 'screen.dart';
import 'demo/speed_tape_demo.dart';
import 'demo/compass_rose_demo.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flight display demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.white,
        fontFamily: 'Roboto',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => AppScreen(title: 'Speed tape', child: SpeedTapeDemo()),
        '/compassRose': (context) => AppScreen(title: 'Compass rose', child: CompassRoseDemo()),
      },
    );
  }
}
