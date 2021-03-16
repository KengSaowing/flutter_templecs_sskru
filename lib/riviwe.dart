import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewExample1 extends StatefulWidget {
  @override
  WebViewExample1State createState() => WebViewExample1State();
}

class WebViewExample1State extends State<WebViewExample1> {
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
  }

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: 'http://templecs.herokuapp.com/temple_List',
    );
  }
}