import 'package:flash_chat/components/customButton.dart';
import 'package:flutter/material.dart';
import '../components/customTextfield.dart';

class LoginScreen extends StatefulWidget {
  static String id = '/login';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: Container(
                height: 200.0,
                child: Image.asset('images/logo.png'),
              ),
            ),
            const SizedBox(
              height: 48.0,
            ),
            CustomTextField(hintTextVal: 'Enter your email', colorVal: Colors.lightBlueAccent,onChangeHandler: (){}),
            const SizedBox(
              height: 8.0,
            ),
            CustomTextField(hintTextVal: 'Enter your password.', colorVal: Colors.lightBlueAccent,onChangeHandler: (){}),
            const SizedBox(
              height: 24.0,
            ),
            CustomButton(onPressed: (){}, buttonText:'Log In', buttonColor: Colors.lightBlueAccent),
          ],
        ),
      ),
    );
  }
}