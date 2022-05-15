import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:isro_quiz/constants.dart';
import 'package:isro_quiz/screens/home.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  String? email;
  String? password;
  bool passCheck = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffF55353),
        elevation: 5.0,
        title: Text(
          'ISRO Quiz',
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration:
                        kTextFieldDecoration.copyWith(hintText: 'First Name'),
                  ),
                ),
                SizedBox(
                  width: 5.0,
                ),
                Expanded(
                  child: TextField(
                    decoration:
                        kTextFieldDecoration.copyWith(hintText: 'Last Name'),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            TextField(
              decoration: kTextFieldDecoration.copyWith(
                  hintText: 'School/College Name'),
            ),
            SizedBox(
              height: 10.0,
            ),
            TextField(
              decoration: kTextFieldDecoration.copyWith(
                hintText: 'Email Address',
              ),
              onChanged: (value) {
                email = value;
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            TextField(
              obscureText: true,
              decoration: kTextFieldDecoration.copyWith(
                hintText: 'Password (minimum 6 characters)',
              ),
              onChanged: (value) {
                password = value;
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            TextField(
              obscureText: true,
              decoration: kTextFieldDecoration.copyWith(
                hintText: 'Confirm Password',
              ),
              onChanged: (value) {
                if (password != value) {
                  setState(() {
                    passCheck = false;
                  });
                } else {
                  setState(() {
                    passCheck = true;
                  });
                }
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            passCheck
                ? SizedBox(
                    height: 2.0,
                  )
                : Text(
                    'Passwords do not match',
                    style: TextStyle(color: Colors.red),
                  ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                elevation: 5.0,
                color: Color(0xffF55353),
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  onPressed: () async {
                    try {
                      final user = await _auth.createUserWithEmailAndPassword(
                          email: email.toString(),
                          password: password.toString());
                      if (user != null) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return HomeScreen();
                        }));
                      }
                    } catch (e) {
                      print(e);
                    }
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Register',
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
