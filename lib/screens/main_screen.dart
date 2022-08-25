import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:student_profile/screens/admin_screen.dart';
import 'package:student_profile/screens/scroller.dart';
import 'package:student_profile/services/google.dart';

class MainScreen extends StatelessWidget {
  static String id = 'main_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                signIn().signInWithGoogle().then((_) =>
                    Navigator.pushReplacementNamed(context, Scroller.id));
              },
              child: Text('Google Auth')),
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, AdminScreen.id);
            },
            child: Text('Admin login'),
          )
        ],
      ),
    );
  }
}
