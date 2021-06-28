import 'package:flutter/material.dart';
import 'package:universal_login/universal_login.dart';
import 'package:universal_login_example/service/network_check.dart';
import 'package:universal_login_example/utils/navigation_helper.dart';
import 'package:universal_login_example/widgets/edge_alert.dart';

class HomePageViewModel with ChangeNotifier {
  bool isAppleSignInAvailable = false;

  checkIfAlreadyLoggedIn(BuildContext context) async {
    if (UniversalLogin.isSignedIn()) NavigationHelper.gotoUserInfoView(context);
  }

  loginWithGoogle(BuildContext context) async {
    if (await NetworkCheck.isOnline(context, true)) {
      var user;

      try {
        user = await UniversalLogin.loginGoogle();
      } catch (e) {
        EdgeAlert.show(context,
            title: 'Oops',
            description: "Error Occurred please try again",
            gravity: EdgeAlert.TOP,
            icon: Icons.info_rounded,
            duration: 4,
            backgroundColor: Colors.red);
      }
      print(user);
      if (user != null) {
        NavigationHelper.gotoUserInfoView(context);
      }
    }
  }

  loginWithFacebook(BuildContext context) async {
    if (await NetworkCheck.isOnline(context, true)) {
      var user;

      try {
        user = await UniversalLogin.loginFacebook();
      } catch (e) {
        EdgeAlert.show(context,
            title: 'Oops',
            description: "Error Occurred please try again",
            gravity: EdgeAlert.TOP,
            icon: Icons.info_rounded,
            duration: 4,
            backgroundColor: Colors.red);
      }

      if (user != null) {
        NavigationHelper.gotoUserInfoView(context);
      }
    }
  }

  loginWithApple(BuildContext context) async {
    if (await NetworkCheck.isOnline(context, true)) {
      var user;

      try {
        user = await UniversalLogin.loginApple();
      } catch (e) {
        EdgeAlert.show(context,
            title: 'Oops',
            description: "Error Occurred please try again",
            gravity: EdgeAlert.TOP,
            icon: Icons.info_rounded,
            duration: 4,
            backgroundColor: Colors.red);
      }

      if (user != null) {
        NavigationHelper.gotoUserInfoView(context);
      }
    }
  }
}
