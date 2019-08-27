import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:vocogo/models/quiz_model.dart';

class QuizCard extends StatefulWidget {
  final QuizModel quizModel;

  QuizCard(this.quizModel);

  @override
  _QuizCardState createState() => _QuizCardState();
}

class _QuizCardState extends State<QuizCard> {
  String _result = '';
  bool _correct = false;

  _checkAnswer(String selected) {
    if (selected == widget.quizModel.rightAnswer) {
      _result = 'Correct Answer';
      _correct = true;
    } else {
      _result = 'Wrong Answer';
      _correct = false;
    }
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('${widget.quizModel.question}',
                style: Theme.of(context)
                    .textTheme
                    .subtitle
                    .copyWith(color: Colors.black)),
            SizedBox(height: 16.0),
            RadioButtonGroup(
              labels: widget.quizModel.choices,
              onSelected: _checkAnswer,
              labelStyle: Theme.of(context)
                  .textTheme
                  .subtitle
                  .copyWith(color: Colors.black),
            ),
            SizedBox(height: 16.0),
            Text(
              '$_result',
              style: Theme.of(context)
                  .textTheme
                  .subtitle
                  .copyWith(color: _correct ? Colors.green : Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
