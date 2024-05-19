import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:quizapp/Screens/Questions.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
        storageBucket: "quizapp-24c57.appspot.com",
          apiKey: "AIzaSyDUo7tCfuw5NAIcoQjSk9B3-jKf_POaB8s",
          appId: "1:595430008708:android:1aabf10a12f8e930bedfd1",
          projectId: "quizapp-24c57",
          messagingSenderId: '',));
  runApp(GetMaterialApp(debugShowCheckedModeBanner: false,
      home: QuizApp1()
    // user == null ? loginpage() : QuizApp(),
  ));
}
class QuizApp1 extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp1> {
  late List<Question> question = [];
  int currentQuestionIndex = 0;
  int score = 0;

  @override
  void initState() {
    super.initState();
    fetchQuestions();
  }

  Future<void> fetchQuestions() async {
    final QuerySnapshot snapshot =
    await FirebaseFirestore.instance.collection('quiz').get();

    setState(() {
      question = snapshot.docs.map((doc) {
        final List<String> options = List.from(doc['option'] as List);
        return Question(
          question: doc['question'].toString(),
          option: options,
          correctAnswer: doc['correctAnswer'].toString(),
        );
      }).toList();
    });
  }

  void answerQuestion(String selectedOption) {
    String correctAnswer = question[currentQuestionIndex].correctAnswer;
    if (selectedOption == correctAnswer) {
      setState(() {
        score++;
      });
    }

    if (currentQuestionIndex < question.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      // showResultDialog();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme:const IconThemeData(color: Colors.white),
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text('Quiz',
            style: GoogleFonts.chicle(
              textStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  fontSize: 30,
                  letterSpacing: 1.0),
            )),

      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Question ${currentQuestionIndex + 1}/${question.length.toString()}',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ).centered(),
          const SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(13),
              ),
              child: Column(
                children: [
                  Text(
                    question[currentQuestionIndex].question,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ).centered(),
                  const SizedBox(height: 10.0),
                  ...question[currentQuestionIndex]
                      .option
                      .map((option) {
                    return

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          minimumSize: const Size.fromHeight(50),
                        ),
                        onPressed: () => answerQuestion(option),
                        child: Text(
                          option,
                          style: TextStyle(fontSize: 15),
                        ).p8(),
                      ).py8();
                    // );
                  }).toList()
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
  void showResultDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Quiz Result',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ).centered(),
          content: Text('Your Quiz score: $score / ${question.length}'),
          actions: [
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    setState(() {
                      currentQuestionIndex = 0;
                      score = 0;
                    });
                  },
                  child: const Text('Restart Quiz'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>QuizApp1(),
                      ),);
                    setState(() {
                      currentQuestionIndex = 0;
                      score = 0;
                    });
                  },
                  child: const Text('Go to Home'),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}