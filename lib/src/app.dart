import 'package:flutter/material.dart';
import 'demo/speed_tape_demo.dart';

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
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flight display demo'),
        ),
        body: Container(
            child: SpeedTapeDemo(),
            padding: EdgeInsets.all(20),
            constraints: BoxConstraints.expand()),
      ),
    );
  }
}
