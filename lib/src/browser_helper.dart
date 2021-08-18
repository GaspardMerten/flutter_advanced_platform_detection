import 'dart:async';

/// All the browser supported by this plugin
enum AdvancedBrower { safari, chrome, edge, firefox, opera, internetExplorer }

mixin AdvancedPlatformHelper {
  FutureOr<AdvancedBrower?> getBrowser();

  FutureOr<bool> currentBrowerIs(AdvancedBrower browser) async {
    return getBrowser() == browser;
  }

  late final FutureOr<bool> isSafari = currentBrowerIs(AdvancedBrower.safari);

  late final FutureOr<bool> isEdge = currentBrowerIs(AdvancedBrower.edge);

  late final FutureOr<bool> isChrome = currentBrowerIs(AdvancedBrower.chrome);

  late final FutureOr<bool> isFirefox = currentBrowerIs(AdvancedBrower.firefox);
}
