import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Screens/Questions.dart';

class QuizWidget extends StatefulWidget {
  final List<Question> questions;
  final Function(int) onAnswerSelected;
  const QuizWidget({
    Key? key,
    required this.questions,
    required this.onAnswerSelected,
  }) : super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int currentQuestionIndex = 0;
  int score = 0;

  @override
  Widget build(BuildContext context) {
    final Question currentQuestion = widget.questions[currentQuestionIndex];
    return Column(
      children: [
        Text(
          'Question ${currentQuestionIndex + 1}/${widget.questions.length}',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
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
                  currentQuestion.question,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10.0),
                ...currentQuestion.option.map((option) {
                  return GestureDetector(
                    onTap: () {
                      widget.onAnswerSelected(
                        currentQuestion.option.indexOf(option),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 24,
                      ),
                      margin: const EdgeInsets.symmetric(
                        vertical: 4,
                        horizontal: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(13),
                      ),
                      child: Text(
                        option,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  );
                }).toList(),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    if (currentQuestionIndex < widget.questions.length - 1) {
                      setState(() {
                        currentQuestionIndex++;
                      });
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Quiz Result'),
                            content: Text('Your score is $score'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  setState(() {
                                    currentQuestionIndex = 0;
                                    score = 0;
                                  });
                                },
                                child: const Text('Restart'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  child: const Text('Next'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}