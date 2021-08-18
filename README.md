# Advanced Platform Detection (os & browser)

[![pub package](https://img.shields.io/pub/v/advanced_platform_detection.svg)](https://pub.dartlang.org/packages/advanced_platform_detection)

<i>A fully cross-platform plugin to retrieve the os, the browser? ;) and more !</i>

## Usage

In the `pubspec.yaml` of your flutter project, add the following dependency:

```yaml
dependencies:
  ...
  advanced_platform_detection: ^1.0.0
```

In your library add the following import:

```dart
import 'package:advanced_platform_detection/advanced_platform_detection.dart';



@override
Widget build(BuildContext context) {
  if (AdvancedPlatform.isIOS) {
    
  } else (AdvancedPlatform.isWeb) {
    
  } else (AdvancedPlatform.isSafari) { /// returns false if isWeb is false...
    
  }
  
  ...
}

```

