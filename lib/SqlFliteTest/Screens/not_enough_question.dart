import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizapp/SqlFliteTest/Screens/home_page.dart';
import 'package:quizapp/SqlFliteTest/app_router.dart';


class NotEnoughQuestion extends StatefulWidget {
  const NotEnoughQuestion({Key? key}) : super(key: key);

  @override
  State<NotEnoughQuestion> createState() => _NotEnoughQuestionState();
}

class _NotEnoughQuestionState extends State<NotEnoughQuestion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Quiz App',
          style: TextStyle(
              color: Colors.white,
              fontSize: 20.sp
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: 393.w,),
          Text(
            'Sorry!',
            style: TextStyle(
                color: Colors.teal,
                fontSize: 25.sp,
                fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: 15.h,),
          SizedBox(height: 100,
              width: 100,
              child: CircularProgressIndicator()),
          // Text(
          //   "we don't have ",
          //   style: TextStyle(
          //     color: Colors.black,
          //     fontSize: 15.sp
          //   ),
          // ),
          SizedBox(height: 15.h,),
          // Image.asset('assets/images/faq.png',width: 250.w,height: 250.w,),
          SizedBox(height: 30.h,),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.teal,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              )
            ),
            onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));
              // AppRouter.popWidget();
            },
            child: Text(
              'Back to Home',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.sp
              ),
            )
          )
        ],
      ),
    );
  }
}

