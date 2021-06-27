import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:universal_login/universal_login.dart';
import 'package:universal_login_example/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await UniversalLogin.initializeFirebase();

  runApp(new MaterialApp(
    title: "Universal Login Test",
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => HomePage(),
    },
  ));
}
