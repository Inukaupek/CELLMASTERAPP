import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black,
    elevation: 0,
  ),
  colorScheme: ColorScheme.dark(
    background: Colors.black,
    primary: Colors.grey[900]!,
    secondary: Color.fromARGB(255, 182, 199, 241),
    surface: Colors.grey[700]!,
  ),
  textTheme: TextTheme(
      displayLarge: TextStyle(
        color: Colors.white,
      ),
      displayMedium: TextStyle(
        color: Color.fromARGB(255, 255, 182, 46),
      ),
      displaySmall: TextStyle(
        color: Colors.white,
      )),
  iconTheme: const IconThemeData(
    color: Colors.white,
  ),
);
