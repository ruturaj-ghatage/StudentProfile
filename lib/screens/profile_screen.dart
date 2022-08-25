import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProfilePage extends StatelessWidget {

  static String id = 'profile_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(
        'Profile page',
      ),
    );
  }
}