import 'package:flutter/material.dart';
import 'package:learning_flutter/Home/pages/main_page.dart';
import 'package:learning_flutter/Login/pages/login_page.dart';
import 'package:learning_flutter/Login/pages/signup_page.dart';

class AppRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'signUp':
        return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) => SignupPage(),
        );
        break;

      case 'login':
        return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) => LoginPage(),
        );
        break;

      case '/':
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) => HomePage(),
        );
        break;
    }
  }
}
