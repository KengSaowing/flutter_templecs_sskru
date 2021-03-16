import 'package:flutter/material.dart';
import 'package:temple/login.dart';
import 'package:temple/search.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  MyApp2(),
    );
  }
}
