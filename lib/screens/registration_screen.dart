import 'package:flutter/material.dart';
import '../components/customButton.dart';
import '../components/customTextfield.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = '/register';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String email = '';
  String password = '';
  
  void setEmail(emailVal){
    email = emailVal;
  }
  void setPassword(pass){
    password = pass;
  }

  void onPressHandler(){
    print(email);
    print(password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: Container(
                height: 100.0,
                child: Image.asset('images/logo.png'),
              ),
            ),
            const SizedBox(
              height: 48.0,
            ),
           CustomTextField(hintTextVal: 'Enter your email', colorVal: Colors.blueAccent, onChangeHandler: setEmail),
            const SizedBox(
              height: 8.0,
            ),
            CustomTextField(hintTextVal: 'Enter your password', colorVal: Colors.blueAccent, onChangeHandler: setPassword),
            const SizedBox(
              height: 24.0,
            ),
            CustomButton(onPressed: onPressHandler, buttonText: 'Register', buttonColor: Colors.blueAccent)
          ],
        ),
      ),
    );
  }
}