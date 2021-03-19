import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:learning_flutter/Login/view_models/login_google_view_model.dart';
import 'package:learning_flutter/Login/view_models/sign_view_model.dart';
import 'package:learning_flutter/utils/app_route.dart';
import 'package:learning_flutter/utils/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: <SingleChildWidget>[
        ChangeNotifierProvider<LoginGoogleViewModel>(
            create: (_) => LoginGoogleViewModel()),
        ChangeNotifierProvider<SignViewModel>(create: (_) => SignViewModel()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget with SharedPreferencesHandler {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: AppRoute.generateRoute,
      initialRoute: '/',
    );
  }
}
