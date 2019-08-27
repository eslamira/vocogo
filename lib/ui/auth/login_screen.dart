import 'package:flutter/material.dart';
import 'package:tiny_widgets/tiny_widgets.dart';
import 'package:vocogo/ui/auth/forgot_password.dart';
import 'package:vocogo/ui/auth/signup_screen.dart';
import 'package:vocogo/ui/quiz_screen.dart';
import 'package:vocogo/utils/auth_client.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _pass = TextEditingController();

  _login() async {
    try {
      TinyLoadingPopUp().tinyLoading(context);
      await AuthClient.internal()
          .loginWithEmailAndPass(_email.text, _pass.text);
      Navigator.of(context).pop();
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => QuizScreen()),
          (route) => false);
    } catch (e) {
      Navigator.of(context).pop();
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        duration: Duration(seconds: 5),
        content: Text(e.toString()),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 48.0),
              Container(
                height: 120.0,
                width: 120.0,
                child: Image.asset('assets/imgs/logo.png'),
              ),
              SizedBox(height: 12.0),
              Text(
                'Welcome Back,',
                style: Theme.of(context).textTheme.title,
              ),
              SizedBox(height: 4.0),
              Text(
                'Sign in to continue',
                style: Theme.of(context).textTheme.subtitle,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: _email,
                  style: Theme.of(context).textTheme.display1,
                  decoration: InputDecoration(
                    labelText: 'E-mail',
                    labelStyle: Theme.of(context)
                        .textTheme
                        .subtitle
                        .copyWith(color: Colors.black),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: _pass,
                  obscureText: true,
                  style: Theme.of(context).textTheme.display1,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: Theme.of(context)
                        .textTheme
                        .subtitle
                        .copyWith(color: Colors.black),
                  ),
                ),
              ),
              InkWell(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => ForgotPassword())),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Forgor Password?',
                      style: Theme.of(context).textTheme.subtitle,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () async => await _login(),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Color(0xFFb224ef),
                    Color(0xFF7579ff),
                  ])),
                  child: Center(
                    child: Text(
                      'Login',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12.0),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: InkWell(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => SignupScreen())),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'New user? ',
                          style: Theme.of(context).textTheme.subtitle,
                        ),
                        Text(
                          ' Signup',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle
                              .copyWith(color: Theme.of(context).primaryColor),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
