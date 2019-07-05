import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Flight display',
                style: TextStyle(color: Colors.black, fontSize: 40.0)),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
          ),
          ListTile(
            title: Text('Speed tape'),
            onTap: () {
              Navigator.of(context).pushNamed('/');
            },
          ),
          ListTile(
            title: Text('Compass rose'),
            onTap: () {
              Navigator.of(context).pushNamed('/compassRose');
            },
          ),
        ],
      ),
    );
  }
}
