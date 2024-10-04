import 'dart:convert';
import 'package:cellmasterapp/screens/home.dart';
import 'package:cellmasterapp/services/authentication.dart';
import 'package:cellmasterapp/widgets/errorSnackBar.dart';
import 'package:http/http.dart' as http;
import 'package:cellmasterapp/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:cellmasterapp/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);

  @override
  _registerState createState() => _registerState();
}

class _registerState extends State<register> {
  String _name = '';
  String _address = '';
  String _email = '';
  String _contact = '';
  String _password = '';

  AccountcreatePressed() async {
    bool emailValid = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(_email);

    if (emailValid) {
      http.Response response = await AuthService.Register(
          _name, _address, _email, _contact, _password);

      Map<String, dynamic> responseMap = json.decode(response.body);
      if (response.statusCode == 200) {
        String token = responseMap['token'];
        Map<String, dynamic> user = responseMap['customer'];

        await saveUserData(token, user);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const HomeScreen()));
      } else {
        errorSnackBar(context, responseMap.values.first);
      }
    } else {
      errorSnackBar(context, 'Invalid Inputs');
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
            Center(
              child: Container(
                alignment: Alignment.center,
                child: Image(
                  alignment: Alignment.centerLeft,
                  height: 150,
                  width: 120,
                  image: AssetImage(
                    Theme.of(context).brightness == Brightness.dark
                        ? 'lib/images/darklogo.png'
                        : 'lib/images/logo.png',
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Create an Account',
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
                'Connect with Latest trend hub',
                style: TextStyle(
                  fontSize: 15,
                  color: Color.fromARGB(255, 149, 148, 148),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Text(
                'Name',
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
                  hintText: 'Enter your Name',
                  hintStyle: TextStyle(
                    color: Color.fromARGB(255, 149, 148, 148),
                  ),
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    _name = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 4),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Text(
                'Address',
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
                  hintText: 'Enter your Address',
                  hintStyle: TextStyle(
                    color: Color.fromARGB(255, 149, 148, 148),
                  ),
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    _address = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 4),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Text(
                'Email Address',
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
                  hintText: 'Enter your email address',
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
            const SizedBox(height: 4),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Text(
                'Contact Number',
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
                  hintText: 'Enter your contact number',
                  hintStyle: TextStyle(
                    color: Color.fromARGB(255, 149, 148, 148),
                  ),
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    _contact = value;
                  });
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Text(
                'Password',
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
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: RoundedButton(
                  buttontext: 'Register',
                  onButtonPressed: () => AccountcreatePressed()),
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
                          'Sign up with Google',
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
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an Account?',
                  style: TextStyle(
                    color: Theme.of(context).textTheme.displayLarge!.color,
                    fontSize: 15,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  },
                  child: const Text(
                    ' Login',
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
