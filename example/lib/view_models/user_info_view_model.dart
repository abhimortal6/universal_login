import 'package:flutter/material.dart';
import 'package:universal_login/universal_login.dart';
import 'package:universal_login_example/utils/navigation_helper.dart';

class UserInfoViewModel with ChangeNotifier {
  var user;

  getCurrentUser() {
    user = UniversalLogin.getFirebaseAuthInstance().currentUser;
    notifyListeners();
  }

  logout(BuildContext context) async {
    await UniversalLogin.logout();
    NavigationHelper.clearStackAndGotoHomePage(context);
  }
}
