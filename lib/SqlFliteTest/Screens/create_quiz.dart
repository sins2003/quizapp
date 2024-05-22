


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:quizapp/SqlFliteTest/Provider/quiz_provider.dart';
import 'package:quizapp/SqlFliteTest/Screens/add_new_question.dart';
import 'package:quizapp/SqlFliteTest/Widgets/question_widget.dart';
import 'package:quizapp/SqlFliteTest/app_router.dart';

class CreateQuiz extends StatefulWidget {
  const CreateQuiz({Key? key}) : super(key: key);

  @override
  State<CreateQuiz> createState() => _CreateQuizState();
}

class _CreateQuizState extends State<CreateQuiz> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<QuizProvider>(context,listen: false).selectAllQuestions();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<QuizProvider>(
      builder: (context,quizProvider,child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text(
              'Create Quiz',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.sp
              ),
            ),
            centerTitle: true,
          ),
          body:quizProvider.questions.isEmpty
          ?Center(
            child: Column(
              children: [
                SizedBox(width: MediaQuery.of(context).size.width,),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.h,horizontal: 8.w),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          backgroundColor: Colors.teal,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r)
                          )
                      ),
                      onPressed: (){
                        // AppRouter.pushWidget(AddNewQuestion());
                        Navigator.push(context, MaterialPageRoute(builder: (context) => AddNewQuestion(),));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add,size: 24.w,color: Colors.white,),
                          Text(
                            ' Add New Question',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp
                            ),
                          ),
                        ],
                      )
                  ),
                ),
                const Spacer(),
                // Image.asset('assets/images/faq.png',width: 250.w,height: 250.w,),
                // Text(
                //   'Add Some Questions to See it Here!',
                //   style: TextStyle(
                //       color: Colors.black,
                //       fontSize: 15.sp
                //   ),
                // ),
                const Spacer(),
              ],
            ),
          )
          :SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(width: MediaQuery.of(context).size.width,),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.h,horizontal: 8.w),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r)
                      )
                    ),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddNewQuestion(),));
                      // AppRouter.pushWidget(AddNewQuestion());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add,size: 24.w,color: Colors.white,),
                        Text(
                          ' Add New Question',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp
                          ),
                        ),
                      ],
                    )
                  ),
                ),
                Container(
                  color: Colors.white,
                  width: 393.w,
                  height: 679.h,
                  child: ListView.builder(
                    controller: scrollController,
                    itemCount: quizProvider.questions.length,
                    itemBuilder: (context,int index){
                      return QuestionWidget(questionModel: quizProvider.questions[index],);
                    }
                  ),
                )

              ],
            ),
          ),
        );
      }
    );
  }
}
