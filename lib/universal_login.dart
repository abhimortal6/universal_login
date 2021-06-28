import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:universal_login/utils/constants.dart';

class UniversalLogin {
  static Future<FirebaseApp> initializeFirebase() async {
    return await Firebase.initializeApp();
  }

  static FirebaseAuth getFirebaseAuthInstance() {
    return FirebaseAuth.instance;
  }

  static bool isSignedIn() {
    return FirebaseAuth.instance.currentUser != null;
  }

  static Future<User?> loginGoogle({SignInOption? signInOption}) async {
    if (!isSignedIn()) {
      GoogleSignInAccount? userAccount;

      try {
        userAccount = await GoogleSignIn(signInOption: signInOption ?? SignInOption.standard).signIn();
      } catch (e) {
        throw e;
      }

      if (userAccount == null) {
        return null;
      } else {
        GoogleSignInAuthentication googleAuth = await userAccount.authentication;

        OAuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
        return userCredential.user;
      }
    } else {
      return FirebaseAuth.instance.currentUser;
    }
  }

  static logoutGoogle() async {
    bool alreadySigned = await GoogleSignIn().isSignedIn();
    if (alreadySigned) {
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
    } else {
      throw Constants.kUserNotLoggedInError;
    }
  }

  static Future<User?> loginFacebook() async {
    //check if already logged in
    if (!isSignedIn()) {
      LoginResult? userAccount;

      try {
        userAccount = await FacebookAuth.instance.login();
      } catch (e) {
        throw e;
      }

      if ((userAccount.status == LoginStatus.success)) {
        OAuthCredential credential = FacebookAuthProvider.credential(userAccount.accessToken!.token);
        UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
        return userCredential.user;
      }
    } else {
      return FirebaseAuth.instance.currentUser;
    }
  }

  static logoutFacebook() async {
    AccessToken? accessToken = await FacebookAuth.instance.accessToken;
    if (accessToken != null) {
      await FacebookAuth.instance.logOut();
      await FirebaseAuth.instance.signOut();
    } else {
      throw Constants.kUserNotLoggedInError;
    }
  }

  static Future<User?> loginApple() async {
    //check if already logged in
    if (!isSignedIn()) {
      AuthorizationCredentialAppleID? userAccount;

      try {
        userAccount = await SignInWithApple.getAppleIDCredential(
          scopes: [
            AppleIDAuthorizationScopes.email,
            AppleIDAuthorizationScopes.fullName,
          ],
        );
      } catch (e) {
        throw e;
      }

      if (userAccount != null) {
        OAuthCredential credential = OAuthProvider('apple.com').credential(
          idToken: userAccount.identityToken,
          accessToken: userAccount.authorizationCode,
        );
        UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
        return userCredential.user;
      }
    } else {
      return FirebaseAuth.instance.currentUser;
    }
  }

  static Future<bool> checkAppleLoginAvailability() async {
    return await SignInWithApple.isAvailable();
  }

  static logout() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await FirebaseAuth.instance.signOut();
    } else {
      throw Constants.kUserNotLoggedInError;
    }
  }
}
