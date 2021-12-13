
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:device_info/device_info.dart';
import 'package:flutter/services.dart';
import 'package:platform_device_id/platform_device_id.dart';

class DeviceId {
  static Future<String> get imei async {
    if(kIsWeb) {
      String deviceId = await PlatformDeviceId.getDeviceId;
      var digest = sha1.convert(utf8.encode(deviceId));
      return '$digest';
    }
    else {
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
}
