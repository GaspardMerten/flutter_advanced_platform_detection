package be.norse.advanced_platform_detection.advanced_platform_detection

import androidx.annotation.NonNull
import android.os.Build

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** AdvancedPlatformDetectionPlugin */
class AdvancedPlatformDetectionPlugin: FlutterPlugin, MethodCallHandler {
  private lateinit var channel : MethodChannel

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "advanced_platform_detection")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    if (call.method == "getPlatformVersion") {
      result.success(currentVersion().toString())
    } else {
      result.notImplemented()
    }
  }

  fun currentVersion(): kotlin.Double {
    return java.lang.Double.parseDouble(java.lang.String(android.os.Build.VERSION.RELEASE).replaceAll("(\\d+[.]\\d+)(.*)", "$1"))
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
