import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universal_login_example/view_models/home_page_view_model.dart';
import 'package:universal_login_example/view_models/user_info_view_model.dart';
import 'package:universal_login_example/views/home_page_view.dart';
import 'package:universal_login_example/views/user_info_view.dart';

class NavigationHelper {
  static getHomeViewWithProvider() {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => HomePageViewModel(),
        )
      ],
      child: HomePageView(),
    );
  }

  static getUserInfoViewWithProvider() {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserInfoViewModel(),
        )
      ],
      child: UserInfoView(),
    );
  }

  static gotoUserInfoView(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MultiProvider(
                  providers: [
                    ChangeNotifierProvider(
                      create: (_) => UserInfoViewModel(),
                    )
                  ],
                  child: UserInfoView(),
                )));
  }

  static clearStackAndGotoHomePage(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
  }
}
