import 'package:flutter/material.dart';
import 'package:universal_login/universal_login.dart';

class HomePage extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plugin example app'),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: Text("Google"),
                  onPressed: () async {
                    await UniversalLogin.loginGoogle();
                  },
                ),
                ElevatedButton(
                  child: Text("Google SignOut"),
                  onPressed: () async {
                    await UniversalLogin.logoutGoogle();
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: Text("Facebook"),
                  onPressed: () async {
                    await UniversalLogin.loginFacebook();
                  },
                ),
                ElevatedButton(
                  child: Text("Facebook SignOut"),
                  onPressed: () async {
                    await UniversalLogin.logoutFacebook();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
