import Flutter
import UIKit

public class SwiftAdvancedPlatformDetectionPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "advanced_platform_detection", binaryMessenger: registrar.messenger())
    let instance = SwiftAdvancedPlatformDetectionPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result(UIDevice.current.systemVersion)
  }
}
