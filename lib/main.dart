import 'package:flutter/material.dart';
import 'package:weather_app/screen/home.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}


/// This is the main application widget.
