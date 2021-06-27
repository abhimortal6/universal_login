import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UniversalLogin {
  static const MethodChannel _channel = const MethodChannel('universal_login');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<FirebaseApp> initializeFirebase() async {
    return await Firebase.initializeApp();
  }

  static FirebaseAuth getFirebaseAuthInstance() {
    return FirebaseAuth.instance;
  }

  static loginGoogle({SignInOption? signInOption}) async {
    bool alreadySigned = await GoogleSignIn().isSignedIn();
    if (!alreadySigned) {
      GoogleSignInAccount? userAccount = await GoogleSignIn(signInOption: signInOption ?? SignInOption.standard).signIn();

      if (userAccount == null) {
        return;
      } else {
        final googleAuth = await userAccount.authentication;

        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
        print(userCredential.user!.displayName);
      }
    } else {
      print("Already Signed In: ${FirebaseAuth.instance.currentUser!.displayName}");
    }
  }

  static logoutGoogle() async {
    bool alreadySigned = await GoogleSignIn().isSignedIn();
    if (alreadySigned) {
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
    } else {}
  }
}
