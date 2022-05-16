import 'dart:async';
import 'package:flutter/material.dart';
import 'package:isro_quiz/constants.dart';
import 'package:isro_quiz/screens/results.dart';

List<String> UserAns = [];
String ans = 'E';

class Quiz extends StatefulWidget {
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

  @override
  void startCountdown() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (timeleft > 0) {
        setState(() {
          timeleft = timeleft - 1;
        });
      } else {
        if (index == 10) {
          timer.cancel();
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: ((context) => Results(
                        UserAns: UserAns,
                      ))));
        }
        UserAns.add(ans);
        setState(() {
          timeleft = 10;
          if (index <= 9) {
            question = QuestionCard(
                question: Questions[index],
                A: A[index],
                B: B[index],
                C: C[index],
                D: D[index]);
            index++;
          }
        });
      }
    });
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
        TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Results(
                            UserAns: UserAns,
                          )));
            },
            child: Text('Finish Test'))
      ],
    );
  }
}

class QuestionCard extends StatefulWidget {
  @override
  QuestionCard(
      {required this.question,
      required this.A,
      required this.B,
      required this.C,
      required this.D});
  final String question;
  final String A;
  final String B;
  final String C;
  final String D;
  State<QuestionCard> createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  Color buttonA = Colors.white;
  Color buttonB = Colors.white;
  Color buttonC = Colors.white;
  Color buttonD = Colors.white;
  @override
  void initState() {
    buttonA = Colors.white;
    buttonB = Colors.white;
    buttonC = Colors.white;
    buttonD = Colors.white;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(color: kThemeColor, width: 2.0)),
            padding: EdgeInsets.all(10.0),
            child: Text(
              widget.question,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Material(
            borderRadius: BorderRadius.circular(30.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: buttonA,
                elevation: 5.0,
              ),
              onPressed: () {
                setState(() {
                  buttonA = kThemeColor;
                  buttonB = Colors.white;
                  buttonC = Colors.white;
                  buttonD = Colors.white;
                  ans = 'A';
                });
              },
              child: Row(
                children: [
                  CircleAvatar(
                      child: Text(
                    'A',
                    style: TextStyle(color: Colors.black, fontSize: 15.0),
                  )),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(widget.A,
                      style: TextStyle(color: Colors.black, fontSize: 15.0)),
                ],
              ),
            ),
          ),
          TextButton(
            style:
                TextButton.styleFrom(backgroundColor: buttonB, elevation: 5.0),
            onPressed: () {
              setState(() {
                buttonA = Colors.white;
                buttonB = kThemeColor;
                buttonC = Colors.white;
                buttonD = Colors.white;
                ans = 'B';
              });
            },
            child: Row(
              children: [
                CircleAvatar(
                    child: Text(
                  'B',
                  style: TextStyle(color: Colors.black, fontSize: 15.0),
                )),
                SizedBox(
                  width: 10.0,
                ),
                Text(widget.B,
                    style: TextStyle(color: Colors.black, fontSize: 15.0)),
              ],
            ),
          ),
          TextButton(
            style:
                TextButton.styleFrom(backgroundColor: buttonC, elevation: 5.0),
            onPressed: () {
              setState(() {
                buttonA = Colors.white;
                buttonB = Colors.white;
                buttonC = kThemeColor;
                buttonD = Colors.white;
                ans = 'C';
              });
            },
            child: Row(
              children: [
                CircleAvatar(
                    child: Text(
                  'C',
                  style: TextStyle(color: Colors.black, fontSize: 15.0),
                )),
                SizedBox(
                  width: 10.0,
                ),
                Text(widget.C,
                    style: TextStyle(color: Colors.black, fontSize: 15.0)),
              ],
            ),
          ),
          TextButton(
            style:
                TextButton.styleFrom(backgroundColor: buttonD, elevation: 5.0),
            onPressed: () {
              setState(() {
                buttonA = Colors.white;
                buttonB = Colors.white;
                buttonC = Colors.white;
                buttonD = kThemeColor;
                ans = 'D';
              });
            },
            child: Row(
              children: [
                CircleAvatar(
                    child: Text(
                  'D',
                  style: TextStyle(color: Colors.black, fontSize: 15.0),
                )),
                SizedBox(
                  width: 10.0,
                ),
                Text(widget.D,
                    style: TextStyle(color: Colors.black, fontSize: 15.0)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
