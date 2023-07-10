import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:marquee/marquee.dart';
import '../components/customButton.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = '/';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  late Animation colorChange;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    controller.forward();
    controller.addListener(() => setState(() {}));
    colorChange = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // bottomNavigationBar: SizedBox(child: _marquee(), height: 50,),
        backgroundColor: colorChange.value,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              
              Row(
                children: <Widget>[
                  Hero(
                    tag: 'logo',
                    child: Container(
                      child: Image.asset('images/logo.png'),
                      height: animation.value * 60,
                    ),
                  ),
                  DefaultTextStyle(
                    style: const TextStyle(
                        fontSize: 45.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.grey),
                    child: AnimatedTextKit(
                      animatedTexts: [TyperAnimatedText('Flash Chat')],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 48.0,
              ),
              CustomButton(onPressed: (){Navigator.pushNamed(context, LoginScreen.id);}, buttonColor: Colors.lightBlueAccent, buttonText: 'Login',),
              CustomButton(onPressed: (){Navigator.pushNamed(context, RegistrationScreen.id);}, buttonText: 'Register', buttonColor: Colors.blueAccent)
            ],
          ),
        ),
      ),
    );
  }

  Marquee _marquee() {
    return Marquee(
              text: 'Some sample text that takes some space.',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 20.0),
              scrollAxis: Axis.horizontal,
              crossAxisAlignment: CrossAxisAlignment.start,
              blankSpace: 20.0,
              velocity: 100.0,
              // pauseAfterRound: Duration(seconds: 1),
              startPadding: 10.0,
              // accelerationDuration: Duration(seconds: 1),
              // accelerationCurve: Curves.linear,
              // decelerationDuration: Duration(milliseconds: 500),
              // decelerationCurve: Curves.easeOut,      
            );
  }
}
