import 'package:flutter/material.dart';
import 'pages/auth.dart';
void main() => runApp(Gallery());

class Gallery extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Auth()
    );
  }
}
