import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewExample2 extends StatefulWidget {
  @override
  WebViewExample2State createState() => WebViewExample2State();
}

class WebViewExample2State extends State<WebViewExample2> {
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
  }

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: 'http://templecs.herokuapp.com/wapviwe',
    );
  }
}