import 'package:cellmasterapp/screens/login.dart';
import 'package:flutter/material.dart';

class startscreen extends StatelessWidget {
  const startscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 120, bottom: 50),
          child: Image.asset('lib/images/login1.png', height: 300, width: 300),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 2),
          child: Text(
            'Welcome to CELLMASTER',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              color: Color(0xFF6180CF),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 8, right: 8),
          child: Text(
            'Welcome to CELLMASTER, the best place to buy Mobile phones and Accessories',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              color: Theme.of(context).textTheme.displayLarge?.color,
            ),
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(top: 60),
            child: SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6180CF),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Get Started',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            )),
      ]),
    );
  }
}
