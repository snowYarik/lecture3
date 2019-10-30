import 'package:flutter/material.dart';
import 'package:lecture3/widgets/images_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lecture 3',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          title: TextStyle(
              fontSize: 20.0,
              fontFamily: 'GoogleSans',
              fontWeight: FontWeight.bold),
        ),
      ),
      home: ImagesPage(),
    );
  }
}
