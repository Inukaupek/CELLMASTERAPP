import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0,
  ),
  colorScheme: ColorScheme.light(
    background: Colors.white,
    primary: const Color.fromARGB(255, 202, 202, 202),
    secondary: Color.fromARGB(255, 200, 216, 250),
    surface: Color.fromARGB(0, 0, 0, 0),
  ),
  textTheme: TextTheme(
    displayMedium: TextStyle(
      color: Color.fromARGB(255, 19, 172, 42),
    ),
    displaySmall: TextStyle(
      color: Colors.black,
    ),
  ),
);
