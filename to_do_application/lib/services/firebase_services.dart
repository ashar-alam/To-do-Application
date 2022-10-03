import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/to_do_list.dart';

class FirebaseServices {
  init() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? temp = preferences.getString("User");
    if (temp != null) {
      // currentUser = jsonDecode(temp);
      currentUser = _auth.currentUser;
    }
  }

  final CollectionReference _taskList =
    FirebaseFirestore.instance.collection('tasks');

  final _auth = FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn();
  User? currentUser;
  Future<User?> signInWithGoogle() async {
    // Initialize Firebase
    await Firebase.initializeApp();

    GoogleAuthProvider authProvider = GoogleAuthProvider();
    try {
      UserCredential userCredential = await _auth.signInWithPopup(authProvider);
      currentUser = userCredential.user;
      log(currentUser!.uid.toString());
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString("User", currentUser!.uid.toString());
    } catch (e) {
      log(e.toString());
    }
    return currentUser;
  }

  void signOutGoogle() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }

  addTask(Task newTask) {
    return _taskList.doc(newTask.taskId.toString()).set(newTask.toJson());
  }
}
