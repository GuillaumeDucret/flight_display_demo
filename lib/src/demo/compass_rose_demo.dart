import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flight_display/flight_display.dart';

class CompassRoseDemo extends StatefulWidget {
  @override
  _CompassRoseDemoState createState() => _CompassRoseDemoState();
}

class _CompassRoseDemoState extends State<CompassRoseDemo>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;
  DemoSensorBloc _sensor;

  @override
  void initState() {
    super.initState();

    _sensor = DemoSensorBloc();
    _sensor._trackController.sink.add(50.0);

    _controller = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    );

    _animation = Tween<double>(begin: 1, end: 90).animate(_controller);
    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      }
    });

    _controller.addListener(
        () => _sensor._headingController.sink.add(_animation.value));

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return CompassRose(sensor: _sensor);
  }

  @override
  void dispose() {
    _controller.dispose();
    _sensor.dispose();
    super.dispose();
  }
}

class DemoSensorBloc extends CompassRoseSensorBloc {
  final _headingController = StreamController<double>.broadcast();
  final _trackController = StreamController<double>();

  @override
  Stream<double> get heading => _headingController.stream;

  @override
  Stream<double> get track => _trackController.stream;

  void dispose() {
    _headingController.close();
    _trackController.close();
  }
}
