import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learning_flutter/Login/models/login.dart';
import 'package:learning_flutter/Login/models/sign_status.dart';
import 'package:learning_flutter/utils/shared_preferences.dart';

class SignViewModel extends ChangeNotifier {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final sp = SharedPreferencesHandler();

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
      await sp.setLoginData(
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
}
