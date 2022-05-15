import 'dart:async';

import 'package:flutter/material.dart';
import 'package:isro_quiz/constants.dart';
import 'package:isro_quiz/screens/results.dart';
import 'package:isro_quiz/widgets/QuestionCard.dart';

class Quiz extends StatefulWidget {
  List<String> UserAns = [];

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int timeleft = 10;
  int index = 1;
  Widget question =
      QuestionCard(question: Questions[0], A: A[0], B: B[0], C: C[0], D: D[0]);
  bool firstques = true;
  @override
  void initState() {
    startCountdown();
    // TODO: implement initState
    super.initState();
  }

  void startCountdown() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (timeleft > 0) {
        setState(() {
          timeleft = timeleft - 1;
        });
      } else {
        timeleft = 10;
        if (index <= 9) {
          question = QuestionCard(
              question: Questions[index],
              A: A[index],
              B: B[index],
              C: C[index],
              D: D[index]);
          index++;
        } else {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Results()));
        }
      }
    });
  }

  @override
  void dispose() {
    print(widget.UserAns);
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          timeleft.toString(),
          style: TextStyle(fontSize: 50.0),
        ),
        question,
      ],
    );
  }
}
