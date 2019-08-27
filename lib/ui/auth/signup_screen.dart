import 'package:flutter/material.dart';
import 'package:tiny_widgets/tiny_widgets.dart';
import 'package:vocogo/ui/quiz_screen.dart';
import 'package:vocogo/utils/auth_client.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  final _passKey = GlobalKey<FormFieldState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _pass = TextEditingController();

  _signup() async {
    try {
      if (_formKey.currentState.validate()) {
        TinyLoadingPopUp().tinyLoading(context);
        await AuthClient.internal()
            .signupWithEmailAndPass(_email.text, _pass.text);
        Navigator.of(context).pop();
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => QuizScreen()),
            (route) => false);
      }
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
          child: Form(
            key: _formKey,
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
                  'Signup',
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(height: 4.0),
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
                  child: TextFormField(
                    key: _passKey,
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
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    obscureText: true,
                    validator: (v) => _passKey.currentState.value == v
                        ? null
                        : "Password don't match",
                    style: Theme.of(context).textTheme.display1,
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      labelStyle: Theme.of(context)
                          .textTheme
                          .subtitle
                          .copyWith(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(height: 48.0),
                InkWell(
                  onTap: () async => await _signup(),
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
                        'Signup',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
