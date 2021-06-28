import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        //TODO: Implement Loading Widget of Choice DONE
        child: SpinKitFadingCube(
          color: Colors.white,
          size: 80,
        ),
      ),
    );
  }
}

