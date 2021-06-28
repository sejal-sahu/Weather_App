import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:weather/loading.dart';
import 'dart:ui' as ui;
import 'loading.dart';

void main() {
  RenderErrorBox.backgroundColor = Colors.blueGrey;
  RenderErrorBox.textStyle = ui.TextStyle(color: Colors.transparent);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Loading(),
      debugShowCheckedModeBanner: false,
    );
  }
}
