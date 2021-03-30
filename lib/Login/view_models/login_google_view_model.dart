import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:learning_flutter/Login/models/login.dart';
import 'package:learning_flutter/Login/models/sign_status.dart';
import 'package:learning_flutter/Login/view_models/login_view_model.dart';
import 'package:learning_flutter/utils/shared_preferences.dart';

class SignGoogleViewModel extends ChangeNotifier with SharedPreferencesHandler {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<SignStatus> signInGoogle() async {
    var result;
    try {
      final GoogleSignInAccount googleSignInAccount =
          await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final UserCredential userCredential =
          await auth.signInWithCredential(credential);
      final User user = userCredential.user;

      if (!user.isAnonymous && await user.getIdToken() != null) {
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
      } else {
        result = SignStatus(
          status: false,
          message: 'Sign-in failed',
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

  // Future signOutGoogle() async {
  //   await googleSignIn.signOut();
  //   await setLoginData(null);
  // }

Future<bool> signOutGoogle() async {
  try {
    await googleSignIn.signOut();
    setLoginData(null);
    return true;
  } catch (e) {
    return false;
  }
}
}
