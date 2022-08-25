import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:google_sign_in/google_sign_in.dart';

class signIn{

  final _auth = FirebaseAuth.instance;


  Future signInWithGoogle() async{

    late final bool isNewUser;

    try{
        
      UserCredential userCredential;

      if(kIsWeb){

        var googleProvider = GoogleAuthProvider();
        userCredential = await _auth.signInWithPopup(googleProvider);
      }else{

        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
        final GoogleSignInAuthentication? googleAuth = await googleUser!.authentication;

        final GoogleAuthCredential = GoogleAuthProvider.credential(
          accessToken: googleAuth!.accessToken,
          idToken: googleAuth.idToken,
        );

        userCredential = await _auth.signInWithCredential(GoogleAuthCredential);
        isNewUser = userCredential.additionalUserInfo!.isNewUser;

        
      }

      if(isNewUser){
          storeDetails();
        }
        return;

    }catch(e){
      print(e);
    }

  }


  Future <void> storeDetails() async{

    CollectionReference userCollection = FirebaseFirestore.instance.collection('users');

    FirebaseAuth auth = FirebaseAuth.instance;
    String uid = auth.currentUser!.uid.toString();
    String email = auth.currentUser!.email.toString();
    User? user = auth.currentUser;

    userCollection.doc(uid).set({
      'email': email,
    });

  }



}