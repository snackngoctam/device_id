
import 'dart:async';
import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/services.dart';

class DeviceId {
  static Future<String> get imei async {
    if (Platform.isAndroid){
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      return androidInfo.androidId;
    }
    else {
      MethodChannel _channel = MethodChannel("flutter.io/iOSIMEI");
      return await _channel.invokeMethod<String>('iOSIMEI');
    }
  }
}
