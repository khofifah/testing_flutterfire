import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:learning_flutter/Login/models/login.dart';
import 'package:learning_flutter/utils/app_sizes%20copy.dart';
import 'package:learning_flutter/utils/shared_preferences.dart';
import 'package:learning_flutter/widgets/custom_button.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SharedPreferencesHandler {
  Login dataLogin;

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    var dataJson = await getLoginData();
    Login data = Login.fromMap(json.decode(dataJson));

    setState(() {
      dataLogin = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home screen'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(Sizes.s10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Welcome, ${dataLogin.email}!',
              style: TextStyle(
                fontSize: FontSizes.s30,
                fontWeight: FontWeight.bold,
              ),
            ),
            CustomButton(
              label: 'Sign-out',
              onPressed: () {
                print('lalala');
              },
            )
          ],
        ),
      ),
    );
  }
}
