import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todo_dec/utils/constants/color_constants.dart';
import 'package:todo_dec/utils/constants/image_constants.dart';
import 'package:todo_dec/view/note_screen/note_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => NoteScreen(),
          ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.mainBlack,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 100,
              width: 100,
              child: Image.asset(ImageConstants.appLogo),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Note pad",
              style: TextStyle(
                fontSize: 40,
                color: ColorConstants.mainLightGrey,
                fontWeight: FontWeight.w900,
              ),
            )
          ],
        ),
      ),
    );
  }
}
