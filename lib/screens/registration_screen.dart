import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../components/ButtonWidget.dart';

class RegistrationScreen extends StatelessWidget {

  static String id = 'registration_screen';

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
              'Register',
              style: TextStyle(
                  fontSize: MediaQuery
                      .of(context)
                      .size
                      .height * 0.02),
            ),
            Text(
              'Email',
              style: TextStyle(
                  fontSize: MediaQuery
                      .of(context)
                      .size
                      .height * 0.02),
            ),
            TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.mail),
                hintText: 'Email',
                hintStyle: TextStyle(
                    fontSize: MediaQuery
                        .of(context)
                        .size
                        .height * 0.02),
              ),
              onChanged: (value) =>
              {
                email = value,
              },
            ),
            Text(
              'Password',
              style: TextStyle(
                  fontSize: MediaQuery
                      .of(context)
                      .size
                      .height * 0.02),
            ),
            TextField(
              decoration: InputDecoration(
                hintStyle: TextStyle(
                    fontSize: MediaQuery
                        .of(context)
                        .size
                        .height * 0.02),
                hintText: 'Password',
                icon: Icon(Icons.lock),
              ),
              onChanged: (value) =>
              {
                password = value,
              },
            ),
            
          ],
        ),
      ),
    );
  }
}