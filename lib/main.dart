import 'dart:async';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Poc Flutter WebView',
        home: Scaffold(
            body: Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: WebView(
                  initialUrl: 'https://antonioolf.github.io/keep-clone/',
                  javascriptMode: JavascriptMode.unrestricted,
                  navigationDelegate: (NavigationRequest request) {
                    openMap(request.url);

                    return NavigationDecision.navigate;
                  }
                )
            )
        )
    );
  }

  static Future<void> openMap(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Cannot launch URL');
    }
  }
}