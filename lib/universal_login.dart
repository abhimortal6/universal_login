
import 'dart:async';

import 'package:flutter/services.dart';

class UniversalLogin {
  static const MethodChannel _channel =
      const MethodChannel('universal_login');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
