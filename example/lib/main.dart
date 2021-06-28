import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:universal_login/universal_login.dart';
import 'package:universal_login_example/utils/navigation_helper.dart';
import 'package:universal_login_example/views/home_page_view.dart';

void main() async {
  //Using native SDKs so making sure their bindings are initialised
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await UniversalLogin.initializeFirebase();

  runApp(new MaterialApp(
    title: "Universal Login Test",
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) =>
          UniversalLogin.isSignedIn() ? NavigationHelper.getUserInfoViewWithProvider() : NavigationHelper.getHomeViewWithProvider(),
    },
  ));
}
