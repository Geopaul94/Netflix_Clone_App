import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:netflix/presentaion/main_page/screen_mainpage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    goToMainScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          "assets/netflix.json",
          width: 200,
        ),
      ),
    );
  }

  goToMainScreen() {
    Timer(const Duration(seconds: 4), () {
    
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ScreenMainPage(),
        ),
      );
    });
  }
}