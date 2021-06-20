import 'package:flutter/material.dart';
import './screens/loading.dart';
// import './screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home',
      routes: {
        LoadingScreen.routeName: (ctx) => LoadingScreen(),
        // Home.routeName: (ctx) => Home(),
      },
    );
  }
}
