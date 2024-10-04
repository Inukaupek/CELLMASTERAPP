import 'package:flutter/material.dart';
import 'package:cellmasterapp/screens/splashscreen.dart';
import 'package:cellmasterapp/theme/darktheme.dart';
import 'package:cellmasterapp/theme/lighttheme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      home: splash(),
    );
  }
}
