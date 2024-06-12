import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/core/colours/colors.dart';

import 'package:netflix/presentaion/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
        scaffoldBackgroundColor:backgroundColor,
        fontFamily: GoogleFonts.montserrat().fontFamily,
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
        bodyLarge: TextStyle(
          color: Colors.white
        ),bodyMedium: TextStyle(
          color: Colors.white
        ) 
        ),
        

      ),
      home:const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}


