import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:learning_flutter/Login/models/login.dart';
import 'package:learning_flutter/Login/models/sign_status.dart';
import 'package:learning_flutter/utils/shared_preferences.dart';

class SignViewModel extends ChangeNotifier with SharedPreferencesHandler {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  // final sp = SharedPreferencesHandler();

  Future<SignStatus> signUp(String email, String password) async {
    var result;
    try {
      final UserCredential userCredential =
          await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final User user = userCredential.user;
      final login = Login(
        email: user.email.toString(),
        nama: user.displayName.toString(),
      );
      await setLoginData(
        json.encode(login.toMap(login)),
      );
      result = SignStatus(
        status: true,
        message: 'Sign-up success',
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        result = SignStatus(
          status: false,
          message: 'The password provided is too weak',
        );
      } else if (e.code == 'email-already-in-use') {
        result = SignStatus(
          status: false,
          message: 'The account already exists for that email',
        );
      }
    } catch (e) {
      result = SignStatus(
        status: false,
        message: e.message,
      );
    }
    return result;
  }

  Future<bool> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      await googleSignIn.signOut();
      setLoginData(null);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<SignStatus> signIn(String email, String password) async {
    var result;
    try {
      final UserCredential userCredential =
          await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final User user = userCredential.user;
      final login = Login(
        email: user.email.toString(),
        nama: user.displayName.toString(),
      );
      await setLoginData(
        json.encode(login.toMap(login)),
      );
      result = SignStatus(
        status: true,
        message: 'Sign-in success',
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        result = SignStatus(
          status: false,
          message: 'No user found for that email.',
        );
      } else if (e.code == 'wrong-password') {
        result = SignStatus(
          status: false,
          message: 'Wrong password provided for that user.',
        );
      }
    } catch (e) {
      result = SignStatus(
        status: false,
        message: e.message,
      );
    }
    return result;
  }
}
