import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_profile/screens/registration_screen.dart';

import '../components/ButtonWidget.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    String email = '';
    String password = '';

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Login',
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.02),
            ),
            Text(
              'Email',
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.02),
            ),
            TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.mail),
                hintText: 'Email',
                hintStyle: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.02),
              ),
              onChanged: (value) => {
                email = value,
              },
            ),
            Text(
              'Password',
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.02),
            ),
            TextField(
              decoration: InputDecoration(
                hintStyle: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.02),
                hintText: 'Password',
                icon: Icon(Icons.lock),
              ),
              onChanged: (value) => {
                password = value,
              },
            ),
            ButtonWidget(
              colour_name: Colors.redAccent,
              text: Text('Login'),
              onpressed: () {},
            ),
            ButtonWidget(
                colour_name: Colors.green,
                text: Text('Google Sign in'),
                onpressed: () {}),
            ButtonWidget(
                colour_name: Colors.blueAccent,
                text: Text('Sign up'),
                onpressed: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegistrationScreen(),
                          ))
                    }),
          ],
        ),
      ),
    );
  }
}
