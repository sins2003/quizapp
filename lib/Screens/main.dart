import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizapp/Screens/Questions.dart';
import 'package:quizapp/constaints/constants.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late CollectionReference quizCollection;
  late List<Question> questions = [];
  int currentQuestionIndex = 0;
  int score = 0;

  @override
  void initState() {
    quizCollection = FirebaseFirestore.instance.collection("quiz");
    fetchQuestions();
    super.initState();
  }
  Future<void> fetchQuestions() async {
    final QuerySnapshot snapshot =
    await FirebaseFirestore.instance.collection('Quiz').limit(10).get();

    setState(() {
      questions = snapshot.docs.map((doc) {
        final List<String> option = List.from(doc['options'] as List);
        return Question(
          question: doc['question'].toString(),
          option: option,
          correctAnswer:  doc['correctAnswer'].toString(),
        );
      }).toList();
    });
  }


  // code 1
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Quiz App",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xff581541),
      ),
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/bg.jpg"), fit: BoxFit.cover),
        ),
        child: Stack(
          children: [
            // Image(
            //   image: AssetImage("assets/images/bg.jpg"),
            //   fit: BoxFit.cover,
            // ),
            Positioned(
              top: 100,
              right: 30,
              left: 30,
              child: Container(
                height: 550,
                width: 400,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ]),
                child: Column(
                  children: [
                    Text(
                      "Question : ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(""
                        // questions[currentQuestionIndex].question
                    ),
                    GestureDetector(
                      child: Container(
                        margin: EdgeInsets.only(
                            top: kDefaultPadding, left: 10, right: 10),
                        padding: EdgeInsets.all(kDefaultPadding),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("")
                            //     questions[currentQuestionIndex].option.map((option){
                            //   return ElevatedButton(
                            //     style: ElevatedButton.styleFrom(
                            //       shape: const StadiumBorder(),
                            //       backgroundColor: Colors.white,
                            //       foregroundColor: Colors.black,
                            //       minimumSize: const Size.fromHeight(50),
                            //     ),
                            //     onPressed: () {
                            //
                            //     },
                            //     child: Text("",
                            //       // option,
                            //       style: TextStyle(fontSize: 15),
                            //     ).p8(),
                            //   ).py8();
                            //   // );
                            // }) as String),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      child: Container(
                        margin: EdgeInsets.only(
                            top: kDefaultPadding, left: 10, right: 10),
                        padding: EdgeInsets.all(kDefaultPadding),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Option 2"),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      child: Container(
                        margin: EdgeInsets.only(
                            top: kDefaultPadding, left: 10, right: 10),
                        padding: EdgeInsets.all(kDefaultPadding),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Option 3"),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      child: Container(
                        margin: EdgeInsets.only(
                            top: kDefaultPadding, left: 10, right: 10),
                        padding: EdgeInsets.all(kDefaultPadding),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Option 4"),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
                // code 2

              ),
            )
          ],
        ),
      ),
    );
  }
}