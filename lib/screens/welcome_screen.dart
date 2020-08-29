import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/components/rounded_button.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {


  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
      // upperBound: 100.0,
    );
    //
    animation =
        ColorTween(begin: Colors.red, end: Colors.blue).animate(controller);
    controller.forward();
    // animation.addStatusListener((status) {
    //   if(status==AnimationStatus.completed)
    //   controller.reverse(from:1.0);
    //   else if(status==AnimationStatus.dismissed)
    //     controller.forward();
    // });
    //  controller.reverse(from: 1.0);
    controller.addListener(() {
      setState(() {

      });
      //  print(animation.value);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
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
                    height: 100,
                    //controller.value*100,
                  ),
                ),
                TypewriterAnimatedTextKit(
                  speed: Duration(milliseconds: 1000),
                  repeatForever: true,
                  text: ['Cample'],
                  textStyle: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              title: 'Log in', colour: Colors.lightBlueAccent, onPressed: () {
              Navigator.pushNamed(context, LoginScreen.id);
            },),
            RoundedButton(
              title: 'Register', colour: Colors.blueAccent, onPressed: () {
              Navigator.pushNamed(context, RegistrationScreen.id);
            },
            ),
          ],
        ),
      ),
    );
  }
}
