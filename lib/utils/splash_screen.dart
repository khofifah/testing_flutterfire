import 'dart:async';

import 'package:flutter/material.dart';
import 'package:learning_flutter/utils/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SharedPreferencesHandler {
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    var loginData = await getLoginData();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacementNamed(
            context, loginData == null ? 'signUp' : 'home'));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: Image.asset('assets/images/KKM.png'),
    );
  }
}
