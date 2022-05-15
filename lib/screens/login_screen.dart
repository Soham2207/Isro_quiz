import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:isro_quiz/constants.dart';
import 'package:isro_quiz/screens/home.dart';
import 'package:isro_quiz/screens/registration_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  String? email;
  String? password;
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
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextField(
            textAlign: TextAlign.center,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.black),
            onChanged: (value) {
              email = value;
            },
            decoration:
                kTextFieldDecoration.copyWith(hintText: 'Enter your Email'),
          ),
          SizedBox(
            height: 10.0,
          ),
          TextField(
            obscureText: true,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black),
            onChanged: (value) {
              password = value;
            },
            decoration:
                kTextFieldDecoration.copyWith(hintText: 'Enter your Password'),
          ),
          SizedBox(
            height: 5.0,
          ),
          GestureDetector(
            onTap: () {
              _auth.sendPasswordResetEmail(email: email.toString());
            },
            child: Text(
              'Forgot Password?',
              style: TextStyle(color: Colors.lightBlueAccent),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Don\'t have an account?'),
              SizedBox(
                width: 5.0,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return RegistrationScreen();
                  }));
                },
                child: Text(
                  'Register',
                  style: TextStyle(color: Colors.lightBlueAccent),
                ),
              )
            ],
          ),
          SizedBox(
            height: 24.0,
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
                    final user = await _auth.signInWithEmailAndPassword(
                        email: email.toString(), password: password.toString());
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
                  'Login',
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
