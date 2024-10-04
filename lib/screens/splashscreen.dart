import 'package:cellmasterapp/screens/starter.dart';
import 'package:flutter/material.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(milliseconds: 2000), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => startscreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Container(
          child: Image(
            height: 400,
            width: 300,
            image: AssetImage(
              Theme.of(context).brightness == Brightness.dark
                  ? 'lib/images/darklogo.png'
                  : 'lib/images/logo.png',
            ),
          ),
        ),
      ),
    );
  }
}
