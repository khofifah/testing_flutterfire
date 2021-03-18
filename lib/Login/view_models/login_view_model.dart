import 'package:learning_flutter/Login/models/login.dart';

class LoginViewModel {
  Login login;

  LoginViewModel({this.login});

  String get nama {
    return this.login.nama;
  }

  String get email {
    return this.login.email;
  }
}
