import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseServices {

  final _auth = FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn();

  Future<User?> signInWithGoogle() async {
  // Initialize Firebase
  await Firebase.initializeApp();
  User? user;

  GoogleAuthProvider authProvider = GoogleAuthProvider();
    try {
      UserCredential userCredential = await _auth.signInWithPopup(authProvider);
      user = userCredential.user;
      log(user!.uid.toString());
    } catch (e) {
      
      log(e.toString());
    }
    return user;
  }

  void signOutGoogle() async{
    await _googleSignIn.signOut();
    await _auth.signOut();

  }
}