
import 'dart:async';
import 'dart:io';
import 'package:android_id/android_id.dart';
import 'package:flutter/services.dart';

class DeviceId {
  static Future<String?> get imei async {
    if (Platform.isAndroid){
      return await AndroidId().getId();
    }
    else {
      MethodChannel _channel = MethodChannel("flutter.io/iOSIMEI");
      return await _channel.invokeMethod<String>('iOSIMEI');
    }
  }
}
