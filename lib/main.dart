import 'package:flutter/material.dart';
import 'package:quote_app/components/Detail.dart';
import 'package:quote_app/components/home.dart';
import 'package:quote_app/components/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context)=>SplashScreen(),
        '/he':(context)=>homeScreen(),
        '/de':(context)=>DetailScreen(),
      },
    );
  }
}
