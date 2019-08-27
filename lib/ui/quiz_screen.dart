import 'package:flutter/material.dart';
import 'package:tiny_widgets/tiny_widgets.dart';
import 'package:vocogo/models/quiz_model.dart';
import 'package:vocogo/ui/widget/quiz_card.dart';
import 'package:vocogo/utils/database_client.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  List<QuizModel> _quizs = List<QuizModel>();
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initData();
  }

  _initData() async {
    try {
      _quizs = await DatabaseClient.instance.getQuizs();
      _isLoading = false;
      if (mounted) setState(() {});
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
        child: _isLoading
            ? TinyLoading()
            : PageView.builder(
                itemCount: _quizs.length,
                itemBuilder: (BuildContext context, int index) {
                  return QuizCard(_quizs[index]);
                },
              ),
      ),
    );
  }
}
