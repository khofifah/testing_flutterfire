import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:learning_flutter/Login/models/login.dart';
import 'package:learning_flutter/Login/view_models/login_view_model.dart';
import 'package:learning_flutter/utils/shared_preferences.dart';

class LoginGoogleViewModel extends ChangeNotifier {
  LoginViewModel login = LoginViewModel();
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final sp = SharedPreferencesHandler();

  Future loginGoogle() async {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final UserCredential userCredential =
        await auth.signInWithCredential(credential);
    final User user = userCredential.user;
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final User currentUser = auth.currentUser;
    assert(user.uid == currentUser.uid);

    final login = Login(
      email: user.email.toString(),
      nama: user.displayName.toString(),
    );

    this.login = LoginViewModel(login: login);

    await sp.setLoginData(
      json.encode(login.toMap(login)),
    );

    notifyListeners();
  }

  Future logoutGoogle() async {
    await googleSignIn.signOut();
    await sp.setLoginData(null);
  }
}
