import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quizapp/Screens/loginpage.dart';

void main (){
  runApp(MaterialApp(home: Qsplash(),debugShowCheckedModeBanner: false,));
}
class Qsplash extends StatefulWidget{
  @override
  State<Qsplash> createState() => _QsplashState();
}

class _QsplashState extends State<Qsplash> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => loginpage()),
      );
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Quizz")),),
      body: Center(
        child: Lottie.asset("assets/Animations/Animation.json"),
      ),

    );

  }
}