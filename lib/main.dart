import 'package:flutter/material.dart';
import 'package:PillaiFlutter/pages/home.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RWS',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black
      ),
      home: HomePage(),
    );
  }
}