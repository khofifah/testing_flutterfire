import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHandler {
  Future<bool> setLoginData(String loginData) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('loginData', loginData);
  }

  Future<String> getLoginData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('loginData');
  }
}
