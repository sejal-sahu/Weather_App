import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:weather/home_screen.dart';
import 'package:weather/loading_screen.dart';
import 'dart:ui' as ui;
import 'loading_screen.dart';

void main() {
  RenderErrorBox.backgroundColor = Colors.blueGrey;
  RenderErrorBox.textStyle = ui.TextStyle(color: Colors.transparent);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'How\'s weather',
      theme: ThemeData(
        primaryColor: Colors.blue.shade100,
      ),
      home: Home(),
      routes: {},
    );
  }
}

