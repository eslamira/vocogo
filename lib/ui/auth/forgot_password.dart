import 'package:flutter/material.dart';
import 'package:tiny_widgets/tiny_widgets.dart';
import 'package:vocogo/utils/auth_client.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _email = TextEditingController();

  _forgotPass() async {
    try {
      TinyLoadingPopUp().tinyLoading(context);
      await AuthClient.internal().sendPasswordResetLink(_email.text);
      Navigator.of(context).pop();
      Navigator.of(context).pop();
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
              'Password Reset',
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
            SizedBox(height: 48.0),
            InkWell(
              onTap: () async => await _forgotPass(),
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
                    'Send',
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
    );
  }
}
