import 'dart:async';
import 'dart:io';

import 'package:advanced_platform_detection/src/browser_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'browser_helper.dart';

abstract class AdvancedPlatform with AdvancedPlatformHelper {
  static const MethodChannel _channel =
      MethodChannel('advanced_platform_detection');

  static Future<num> version() async {
    num version;

    try {
      version = num.parse(await _channel.invokeMethod('getPlatformVersion'));
    } on FormatException catch (_) {
      version = 0.0;
    }

    return version;
  }

  static Future<AdvancedBrower?> browser() async {
    final res = await _channel.invokeMethod('getBrowserName').catchError((e) {
      return Future.value('');
    });

    AdvancedBrower? browser;

    switch (res) {
      case 'Safari':
        browser = AdvancedBrower.safari;
        break;
      case 'Firefox':
        browser = AdvancedBrower.firefox;
        break;
      case 'Chrome':
        browser = AdvancedBrower.chrome;
        break;
      case 'Opera':
        browser = AdvancedBrower.opera;
        break;
      case 'Edge':
        browser = AdvancedBrower.edge;
        break;
      case 'InternetExplorer':
        browser = AdvancedBrower.internetExplorer;
        break;
    }

    return browser;
  }

  static bool isIOS = !kIsWeb && Platform.isIOS;

  static bool isAndroid = !kIsWeb && Platform.isAndroid;

  static bool isWindows = !kIsWeb && Platform.isWindows;

  static bool isFuschia = !kIsWeb && Platform.isFuchsia;

  static bool isMacOS = !kIsWeb && Platform.isMacOS;

  static bool isLinux = !kIsWeb && Platform.isLinux;

  static bool isWeb = kIsWeb;
}
