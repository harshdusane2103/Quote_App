import 'dart:async';

import 'package:flutter/cupertino.dart';
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
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 150,),
          Center(
            child: Container(
              height: 150,
              width:300,
              decoration: BoxDecoration(

                image: DecorationImage(
                  fit: BoxFit.cover,
                    image:
                AssetImage('assets/images/harsh.png'))
              ),


              
            ),
          ),
          Center(child: Text('Quote Thought',style: TextStyle(color: Colors.black,fontSize: 36),)),

          SizedBox(height: 250,),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                SizedBox(width:100,),
                Text('  Quotes Inspire you.. ',style: TextStyle(color: Colors.black,fontSize: 20),)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
