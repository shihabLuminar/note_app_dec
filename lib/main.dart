import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_dec/view/splash_screen/splash_screen.dart';

Future<void> main() async {
  // HIVE step 2
  await Hive.initFlutter();
  // HIVE step 3
  var box = await Hive.openBox('noteBox');
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
