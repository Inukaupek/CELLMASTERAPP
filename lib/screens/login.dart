import 'dart:convert';

import 'package:cellmasterapp/services/authentication.dart';
import 'package:cellmasterapp/widgets/button.dart';
import 'package:cellmasterapp/widgets/errorSnackBar.dart';
import 'package:flutter/material.dart';
import 'package:cellmasterapp/screens/register.dart';
import 'package:cellmasterapp/screens/home.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _email = '';
  String _password = '';

  Future<void> AccountLogin() async {
    if (_email.isNotEmpty && _password.isNotEmpty) {
      http.Response response = await AuthService.Login(_email, _password);
      Map<String, dynamic> responseMap = json.decode(response.body);

      if (response.statusCode == 200) {
        String token = responseMap['token'];
        Map<String, dynamic> user = responseMap['customer'];

        await saveUserData(token, user);

        // Navigate to the HomeScreen
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      } else {
        errorSnackBar(
            context, responseMap['message']); // Adjust to the correct field
      }
    } else {
      errorSnackBar(context, 'Please fill all the fields');
    }
  }

  Future<void> saveUserData(String token, Map<String, dynamic> user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
    await prefs.setString('user', json.encode(user)); // Save user as JSON
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              child: Image(
                height: 250,
                width: 200,
                image: AssetImage(
                  Theme.of(context).brightness == Brightness.dark
                      ? 'lib/images/darklogo.png'
                      : 'lib/images/logo.png',
                ),
              ),
            ),
            const SizedBox(height: 5),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Welcome to CELLMASTER',
                style: TextStyle(
                  fontSize: 22,
                  color: Theme.of(context).textTheme.displayLarge!.color,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Text(
                'Login to see the new Arrivals',
                style: TextStyle(
                  fontSize: 15,
                  color: Color.fromARGB(255, 149, 148, 148),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Text(
                'Email:',
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFF6180CF),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 4),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 50,
              child: TextField(
                decoration: const InputDecoration(
                  hintText: 'Enter your email',
                  hintStyle: TextStyle(
                    color: Color.fromARGB(255, 149, 148, 148),
                  ),
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    _email = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Text(
                'Password:',
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFF6180CF),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 4),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 50,
              child: TextField(
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Enter your password',
                  hintStyle: TextStyle(
                    color: Color.fromARGB(255, 149, 148, 148),
                  ),
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    _password = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 5),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Forgot Password?',
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xFF6180CF),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),

            //login button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: RoundedButton(
                  buttontext: 'Login', onButtonPressed: () => AccountLogin()),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                ),
                Expanded(
                  child: Divider(
                    color: Theme.of(context).textTheme.displayLarge!.color,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                ),
                Text(
                  'Or With',
                  style: TextStyle(
                    color: Theme.of(context).textTheme.displayLarge!.color,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                ),
                Expanded(
                  child: Divider(
                    color: Theme.of(context).textTheme.displayLarge!.color,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                ),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          'lib/images/google.png',
                          width: 30,
                          height: 30,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 35),
                        ),
                        const Text(
                          'Sign in with Google',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                ),
              ],
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have a Account?',
                  style: TextStyle(
                    color: Theme.of(context).textTheme.displayLarge!.color,
                    fontSize: 15,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => register(),
                        ));
                  },
                  child: const Text(
                    ' Register',
                    style: TextStyle(
                      color: Color(0xFF6180CF),
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            )
          ],
        )),
      ),
    );
  }
}
