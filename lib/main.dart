import 'package:flutter/material.dart';
import 'package:vocogo/ui/quiz_screen.dart';
import 'package:vocogo/utils/app_theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VocoGo',
      theme: AppTheme().theme,
      home: QuizScreen(),
    );
  }
}
