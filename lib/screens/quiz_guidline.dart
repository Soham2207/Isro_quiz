import 'package:flutter/material.dart';
import 'package:isro_quiz/constants.dart';
import 'package:isro_quiz/screens/quiz_screen.dart';

class Guidlines extends StatelessWidget {
  const Guidlines({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: kThemeColor,
        title: Text(
          'Quiz Rules & Regulations',
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '1. The Quiz will contain of 10 questions',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              '2. Every Question will be visible for only 10 seconds',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              '3. Every Correct answer will fetch you 4 marks',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              '4. Every Incorrect answer will lead to a negative mark of -1',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              '5. Questions left unanswered will be marked as incorrect',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              '6. Questions are divided into 3 categories: Easy, Medium and Hard',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              '7. They are also from 3 subjects: Physics, Chemistry and Astronomy',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              '8. Please wait for the timer to run down, you cannot submit before time',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(
              height: 20.0,
            ),
            Center(
              child: Material(
                elevation: 5.0,
                color: Color(0xffF55353),
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Quiz()));
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Start Quiz',
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
