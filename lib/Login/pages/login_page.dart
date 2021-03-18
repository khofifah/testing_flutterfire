import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:learning_flutter/Login/view_models/login_google_view_model.dart';
import 'package:learning_flutter/utils/shared_preferences.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SharedPreferencesHandler {
  var dataLogin;

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    final data = await getLoginData();
    setState(() {
      dataLogin = data == null ? data : json.decode(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    final login = Provider.of<LoginGoogleViewModel>(context);

    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            dataLogin == null
                ? Container()
                : Text('nama = ${dataLogin['nama']}'),
            ElevatedButton(
              child: Text('Login Google'),
              onPressed: () async {
                await login.loginGoogle();
                getData();
              },
            ),
            ElevatedButton(
              child: Text('Logout Google'),
              onPressed: () async {
                await login.logoutGoogle();
                getData();
              },
            ),
          ],
        ),
      ),
    );
  }
}
