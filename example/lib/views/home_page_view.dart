import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universal_login/universal_login.dart';
import 'package:universal_login_example/utils/navigation_helper.dart';
import 'package:universal_login_example/view_models/home_page_view_model.dart';
import 'package:universal_login_example/widgets/common_sign_in_button.dart';

class HomePageView extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<HomePageView> {
  HomePageViewModel? _homeViewModel;

  @override
  Widget build(BuildContext context) {
    if (_homeViewModel == null) {
      _homeViewModel = Provider.of<HomePageViewModel>(context);
    }
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Universal Login'),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Welcome to Universal SignIn Plugin Test\n Choose one of the signing method",
                textAlign: TextAlign.center,
              ),
            ),
            CommonSignInButton(
              width: _size.width * 0.6,
              buttonColor: Colors.white,
              title: "Google",
              textColor: Colors.black,
              onPressed: () => _homeViewModel!.loginWithGoogle(context),
            ),
            CommonSignInButton(
              width: _size.width * 0.6,
              title: "Facebook",
              onPressed: () => _homeViewModel!.loginWithFacebook(context),
            ),
            if (Platform.isIOS)
              CommonSignInButton(
                width: _size.width * 0.6,
                title: "Apple",
                buttonColor: Colors.black,
                onPressed: () => _homeViewModel!.loginWithApple(context),
              ),
          ],
        ),
      ),
    );
  }
}
