
import 'package:advanced_platform_detection/advanced_platform_detection.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  num? version;
  dynamic? browser;

  @override
  void initState() {
    super.initState();

    AdvancedPlatform.browser().then((value) {
      setState(() {
        browser = value;
      });
    });

    AdvancedPlatform.version().then((value) {
      setState(() {
        version = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Version $version Browser $browser'),
        ),
      ),
    );
  }
}
