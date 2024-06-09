import 'dart:async';

import 'package:flutter/material.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  
  Widget build(BuildContext context) {

    Timer(Duration(seconds:3),(){Navigator.pushReplacementNamed(context,'/he');});
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Container(
              height: 811,
              width:386,
              decoration: BoxDecoration(
              color: Colors.green,
                image: DecorationImage(
                  fit: BoxFit.cover,
                    image:
                AssetImage('assets/images/had.jpg'))
              ),
            ),
          )
        ],
      ),
    );
  }
}
