import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:student_profile/models/user.dart';
import 'package:student_profile/screens/scroller.dart';

import '../components/ButtonWidget.dart';

final _firestore = FirebaseFirestore.instance.collection('users');
final _auth = FirebaseAuth.instance;


class RegistrationScreen extends StatelessWidget {
  static String id = 'registration_screen';

  final _formkey = GlobalKey<FormState>();

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _college = TextEditingController();
  TextEditingController _age = TextEditingController();

  Future _submit() async {
    if (_formkey.currentState!.validate()) {


      Student st = Student(
        age: int.parse(_age.text),
        name: _name.text,
        collegeName: _college.text,
        email: _email.text,
        password: _password.text,
      );

      
      final user = await _auth.createUserWithEmailAndPassword(email: _email.text, password: _password.text);

      CollectionReference userCollection = FirebaseFirestore.instance.collection('users');

      User? user_curr = _auth.currentUser;

      if(user != null){
        print('Successs!!!!!');

        userCollection.doc(user_curr!.uid).set({
        'name': st.name,
        'college': st.collegeName,
        'age':st.age,
        'email':st.email,
        });

      }

      _formkey.currentState!.save();

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Register',
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.02),
            ),
            Text(
              'Email',
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.02),
            ),
            TextFormField(
              controller: _email,
              validator: (value) {
                if (value!.isEmpty ||
                    !RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                  return 'Give proper email';
                }
                return null;
              },
            ),
            Text(
              'Password',
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.02),
            ),
            TextFormField(
              controller: _password,
              validator: (value) {
                if (value!.length < 8) {
                  return 'Provide a stronger password';
                }
                return null;
              },
            ),
            Text(
              'Name',
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.02),
            ),
            TextFormField(
              controller: _name,
            ),
            Text(
              'College Name',
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.02),
            ),
            TextFormField(
              controller: _college,
            ),
            Text(
              'Age',
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.02),
            ),
            TextFormField(
              controller: _age,
              validator: (value) {
                if (int.parse(value!) < 0 ||
                    int.parse(value) > 100 ||
                    value.isEmpty) {
                  return 'Enter a valid age';
                }
                return null;
              },
            ),
            ButtonWidget(
                colour_name: Colors.black45,
                text: Text('sad'),
                onpressed: () {
                  _submit();
                  Navigator.pushReplacementNamed(context,Scroller.id);
                }),
          ],
        ),
      ),
    );
  }
}
