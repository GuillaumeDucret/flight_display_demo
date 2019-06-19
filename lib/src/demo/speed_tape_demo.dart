import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flight_display/flight_display.dart';

class SpeedTapeDemo extends StatefulWidget {
  static var _speedEnvelope = EnvelopeData(vne: 260, vs: 80);

  @override
  _SpeedTapeDemoState createState() => _SpeedTapeDemoState();
}

class _SpeedTapeDemoState extends State<SpeedTapeDemo>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;
  DemoSensorBloc _speedSensor;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: 180).animate(_controller);
    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      }
    });

    _speedSensor = DemoSensorBloc();
    _controller.addListener(
        () => _speedSensor._airSpeedController.sink.add(_animation.value));

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SpeedTape(
      envelope: SpeedTapeDemo._speedEnvelope,
      sensor: _speedSensor,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _speedSensor.dispose();
    super.dispose();
  }
}

class DemoSensorBloc extends SensorBloc {
  final _airSpeedController = StreamController<double>();

  @override
  Stream<double> get airSpeed => _airSpeedController.stream;

  void dispose() {
    _airSpeedController.close();
  }
}
