import 'package:flutter/material.dart';
import 'package:todo_dec/view/note_screen/note_screen.dart';
import 'package:todo_dec/view/splash_screen/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}
