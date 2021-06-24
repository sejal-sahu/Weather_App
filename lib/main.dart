import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      routes: {
        // Home.routeName: (ctx) => Home(),
      },
    );
  }
}
