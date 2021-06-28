import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universal_login_example/view_models/user_info_view_model.dart';
import 'package:universal_login_example/widgets/common_sign_in_button.dart';
import 'package:universal_login_example/widgets/info_tile.dart';

class UserInfoView extends StatefulWidget {
  UserInfoView({Key? key}) : super(key: key);

  @override
  _UserInfoViewState createState() => _UserInfoViewState();
}

UserInfoViewModel? _userInfoViewModel;

class _UserInfoViewState extends State<UserInfoView> {
  @override
  Widget build(BuildContext context) {
    if (_userInfoViewModel == null) {
      _userInfoViewModel = Provider.of<UserInfoViewModel>(context);
      _userInfoViewModel!.getCurrentUser();
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
            if (_userInfoViewModel!.user != null)
              Column(
                children: [
                  InfoTile(
                    title: "Name",
                    value: _userInfoViewModel!.user.displayName,
                  ),
                  InfoTile(
                    title: "Email",
                    value: _userInfoViewModel!.user.email,
                  ),
                ],
              ),
            CommonSignInButton(
              width: _size.width * 0.4,
              buttonColor: Colors.white,
              title: "Logout",
              textColor: Colors.black,
              onPressed: () => _userInfoViewModel!.logout(context),
            ),
          ],
        ),
      ),
    );
  }
}
