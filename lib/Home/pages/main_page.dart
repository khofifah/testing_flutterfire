import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:learning_flutter/Login/models/login.dart';
import 'package:learning_flutter/Login/view_models/sign_view_model.dart';
import 'package:learning_flutter/utils/app_sizes%20copy.dart';
import 'package:learning_flutter/utils/shared_preferences.dart';
import 'package:learning_flutter/widgets/custom_button.dart';
import 'package:learning_flutter/widgets/popup_status.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SharedPreferencesHandler {
  Login dataLogin;
  bool isLoading = true;

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
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final sign = Provider.of<SignViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Home screen'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(Sizes.s10),
        child: isLoading == true
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
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
                    onPressed: () async {
                      sign.signOut().then((value) {
                        if (value == true) {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              'signUp', (Route<dynamic> route) => false);
                        } else {
                          PopupStatus.showFlushbar(
                            context,
                            false,
                            'Gagal Sign Out',
                          );
                        }
                      });
                    },
                  )
                ],
              ),
      ),
    );
  }
}
