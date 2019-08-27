import 'package:flutter/material.dart';

class AppTheme {
  ThemeData theme = ThemeData(
    primaryColor: Color(0xFFb224ef),
    accentColor: Color(0xFF7579ff),
    textTheme: TextTheme(
      title: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.w900,
      ),
      subtitle: TextStyle(
        fontSize: 18.0,
        color: Colors.grey,
        fontWeight: FontWeight.w600,
      ),
      display1: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
