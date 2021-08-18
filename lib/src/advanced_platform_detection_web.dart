import 'dart:async';
import 'dart:html' as html show window;

import 'package:flutter/services.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

/// A web implementation of the AdvancedPlatformDetection plugin.
class AdvancedPlatformDetectionWeb {
  static void registerWith(Registrar registrar) {
    final MethodChannel channel = MethodChannel(
      'advanced_platform_detection',
      const StandardMethodCodec(),
      registrar,
    );

    final pluginInstance = AdvancedPlatformDetectionWeb();
    channel.setMethodCallHandler(pluginInstance.handleMethodCall);
  }

  /// Handles method calls over the MethodChannel of this plugin.
  /// Note: Check the "federated" architecture for a new way of doing this:
  /// https://flutter.dev/go/federated-plugins
  Future<dynamic> handleMethodCall(MethodCall call) async {
    switch (call.method) {
      case 'getPlatformVersion':
        return getPlatformVersion();
      case 'getBrowserName':
        return getBrowserName();
      default:
        throw PlatformException(
          code: 'Unimplemented',
          details:
              'advanced_platform_detection for web doesn\'t implement \'${call.method}\'',
        );
    }
  }

  /// Returns a [String] containing the version of the platform.
  Future<String> getPlatformVersion() {
    return Future.value('0');
  }

  /// Returns a [String] containing the name of the browser.
  Future<String> getBrowserName() {
    final navigator = html.window.navigator;
    final userAgent = navigator.userAgent;
    final vendor = navigator.vendor;
    final appVersion = navigator.appVersion;

    final bool isFirefox = userAgent.contains('Firefox');

    final bool isChrome = vendor.contains('Google');

    final bool isSafari =
        vendor.contains('Apple') && appVersion.contains('Version');

    final bool isOpera = userAgent.contains(' OPR/');

    final bool isEdge = userAgent.contains('Edg/');

    final bool isIE = !isEdge && userAgent.contains('Microsoft');

    String browserName;

    if (isFirefox) {
      browserName = 'Firefox';
    } else if (isEdge) {
      browserName = 'Edge';
    } else if (isSafari) {
      browserName = 'Safari';
    } else if (isOpera) {
      browserName = 'Opera';
    } else if (isIE) {
      browserName = 'InternetExplorer';
    } else if (isChrome) {
      browserName = 'Chrome';
    } else {
      browserName = 'Unknown';
    }

    return Future.value(browserName);
  }
}
