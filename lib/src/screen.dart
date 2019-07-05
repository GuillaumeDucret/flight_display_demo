import 'package:flutter/material.dart';
import 'drawer.dart';

class AppScreen extends StatelessWidget {
  AppScreen({this.title, this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title ?? 'Flight display demo'),
      ),
      drawer: AppDrawer(),
      body: Container(
        child: child,
        padding: EdgeInsets.all(20),
        constraints: BoxConstraints.expand(),
      ),
    );
  }
}
