import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:student_profile/screens/admin_screen.dart';
import 'package:student_profile/screens/dashboard.dart';
import 'package:student_profile/screens/login_screen.dart';
import 'package:student_profile/screens/main_screen.dart';
import 'package:student_profile/screens/registration_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/scroller.dart';

final _auth = FirebaseAuth.instance;
User? LoginUser = _auth.currentUser;

void getCurrentUser() async {
  try {
    final user = await _auth.currentUser;
    if (user != null) {
      LoginUser = user;
    }
  } catch (e) {
    print('Error');
    print(e);
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  getCurrentUser();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    if (user != null) {
      return MaterialApp(
        initialRoute: Scroller.id,
        routes: {
          // LoginScreen.id: (context) => LoginScreen(),
          // RegistrationScreen.id: (context) => RegistrationScreen(),
          Scroller.id: (context) => Scroller(),
          MainScreen.id: (context) => MainScreen(),
          AdminScreen.id: (context) => AdminScreen(),
          DashBoard.id: (context) => DashBoard(),
        },
      );
    } else {
      return MaterialApp(
        initialRoute: MainScreen.id,
        routes: {
          // LoginScreen.id: (context) => LoginScreen(),
          // RegistrationScreen.id: (context) => RegistrationScreen(),
          Scroller.id: (context) => Scroller(),
          MainScreen.id: (context) => MainScreen(),
          DashBoard.id: (context) => DashBoard(),
          AdminScreen.id: (context) => AdminScreen(),
        },
      );
    }
  }
}
