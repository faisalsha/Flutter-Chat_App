import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flash_app/screens/login_screen.dart';
import 'package:flash_app/screens/registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_app/Components/rounded_button.dart';


class WelcomeScreen extends StatefulWidget {
  static const String id='welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin{
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller=AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,

    );
    animation=ColorTween(begin: Colors.grey,end: Colors.white).animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {

      });
      print(animation.value);
    });




  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:animation.value,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
       crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            children: <Widget>[
              Hero(
                tag: 'logo',
                child: Container(
                  child: Image.asset('images/logo.png'),
                  height: 60.0,
                ),
              ),
              TypewriterAnimatedTextKit(
                text:['Flash Chat'],
                textStyle: TextStyle(
                  fontSize: 45.0,
                  fontWeight: FontWeight.w900,
                ),
              ),

            ],
          ),
          SizedBox(
            height: 48.0,
          ),
          RounedButton(title: 'Log In', colour:Colors.lightBlueAccent ,onPressed: () {
//Go to login screen.
            Navigator.pushNamed(context, LoginScreen.id);
          },),
          RounedButton(title: 'Register', colour:Colors.lightBlueAccent ,onPressed: () {
//Go to registrtation screen screen.
            Navigator.pushNamed(context, RegistrationScreen.id);
          },),

        ],
      ),
    );
  }
}





