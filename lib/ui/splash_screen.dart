import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vocogo/ui/auth/login_screen.dart';
import 'package:vocogo/ui/quiz_screen.dart';
import 'package:vocogo/utils/auth_client.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigate();
  }

  _navigate() async {
    bool loggedIn = await AuthClient.internal().isLoggedIn();
    Timer(Duration(seconds: 3), () {
      if (loggedIn)
        Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) => QuizScreen()));
      else
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => LoginScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/imgs/splash.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
