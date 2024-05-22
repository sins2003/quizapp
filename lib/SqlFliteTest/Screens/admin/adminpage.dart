import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizapp/SqlFliteTest/Screens/UserLogin/loginpage.dart';
import 'package:quizapp/SqlFliteTest/Screens/create_quiz.dart';
import 'package:quizapp/SqlFliteTest/app_router.dart';

class AdminPage extends StatefulWidget {
  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          "Quiz App",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.sp,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
          ),
          Image.asset(
            'assets/images/quiz.png',
            width: 300.w,
            height: 300.w,
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 250,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    padding:
                        EdgeInsets.symmetric(horizontal: 60.w, vertical: 10.h),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r))),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreateQuiz(),
                      ));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.edit,
                      size: 24.w,
                      color: Colors.white,
                    ),
                    Text(
                      'Create Quiz',
                      style: TextStyle(color: Colors.white, fontSize: 16.sp),
                    ),
                  ],
                )),
          ),
          SizedBox(height: 50,),
          SizedBox(
            width: 250,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding:
                  EdgeInsets.symmetric(horizontal: 60.w, vertical: 10.h),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r))),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => loginpage()));
              },
              child: Text("LOG OUT",
                  style: TextStyle(color: Colors.white, fontSize: 16.sp)),
            ),
          )
        ],
      ),
    );
  }
}
