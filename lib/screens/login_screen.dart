import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_profile/screens/scroller.dart';
import 'package:student_profile/screens/registration_screen.dart';
import 'package:student_profile/services/google.dart';

import '../components/ButtonWidget.dart';

class LoginScreen extends StatelessWidget {
  static String id = 'login_screen';
  final _auth = FirebaseAuth.instance;

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
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
                hintText: 'Email',
              ),
              onChanged: ((value) {
                email = value;
              }),
            ),
            Text(
              'Password',
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.02),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Password',
              ),
              onChanged: ((value) {
                password = value;
              }),
            ),
            ButtonWidget(
              colour_name: Colors.redAccent,
              text: Text('Login'),
              onpressed: () async {
                final user = await _auth.signInWithEmailAndPassword(
                    email: email, password: password);

                if (user != null) {
                  print("Logged In");
                  Navigator.pushReplacementNamed(context, Scroller.id);
                }
              },
            ),
            ButtonWidget(
                colour_name: Colors.green,
                text: Text('Google Sign in'),
                onpressed: () {
                  signIn().signInWithGoogle().then((_) =>
                      Navigator.pushReplacementNamed(context, Scroller.id));
                }),
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
