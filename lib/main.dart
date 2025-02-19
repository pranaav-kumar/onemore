import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromRGBO(225, 213, 201, 1),
        body: Center(
          child: Container(
            height: 100,
            width: 300,
            color: Color.fromRGBO(197, 146, 80, 1),
          ),
        ),
      ),
    );
  }
}
