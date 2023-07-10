import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_alt/modal_progress_hud_alt.dart';
import '../components/customButton.dart';
import '../components/customTextfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'chat_screen.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:modal_progress_hud_alt/modal_progress_hud_alt.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = '/register';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String email = '';
  String password = '';

  final _auth = FirebaseAuth.instance;
  void setEmail(emailVal) {
    email = emailVal;
  }

  void setPassword(pass) {
    password = pass;
  }

  @override
  Widget build(BuildContext context) {
    bool spin = false;

    void onPressHandler() async {
      setState(() {
        spin = true;
      });
      final newUser = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      try {
        if (newUser != null) {
          Navigator.pushNamed(context, ChatScreen.id);
        }
        setState(() {
          spin = false;
        });
      } catch (e) {
        print(e);
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: spin,
        child: Padding(
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
              CustomTextField(
                hintTextVal: 'Enter your email',
                colorVal: Colors.blueAccent,
                onChangeHandler: setEmail,
                keyboard: TextInputType.emailAddress,
                obscure: false,
              ),
              const SizedBox(
                height: 8.0,
              ),
              CustomTextField(
                hintTextVal: 'Enter your password',
                colorVal: Colors.blueAccent,
                onChangeHandler: setPassword,
                keyboard: TextInputType.text,
                obscure: true,
              ),
              const SizedBox(
                height: 24.0,
              ),
              CustomButton(
                  onPressed: onPressHandler,
                  buttonText: 'Register',
                  buttonColor: Colors.blueAccent)
            ],
          ),
        ),
      ),
    );
  }
}
