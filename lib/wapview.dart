import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:webview_flutter/webview_flutter.dart';


class WebViewExample extends StatefulWidget {
  @override
  _WebViewExampleState createState() => _WebViewExampleState();
}

class _WebViewExampleState extends State<WebViewExample> {
  Geolocator geolocator = Geolocator();
  Position userLocation;

  final Completer<WebViewController> _controller =
  Completer<WebViewController>();


  Future<String> _getCurrentLocation() async {
    _getLocation().then((position) {
      setState(() {
        userLocation = position;
      });
    });

    print(userLocation.latitude);
    return "get lat and long";
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder(
          future: _getCurrentLocation(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return Container(
                child: WebView(
                    javascriptMode: JavascriptMode.unrestricted,
                    debuggingEnabled: true,
                    initialUrl: "http://templecs.herokuapp.com/?lat=" +
                        userLocation.latitude.toString() +
                        "&long=" +
                        userLocation.longitude.toString(),
                    onWebViewCreated: (WebViewController webViewController) {
                      _controller.complete(webViewController);
                    }),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  // get location by using geolocator
  Future<Position> _getLocation() async {
    var currentLocation;
    try {
      currentLocation = await geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
    } catch (e) {
      currentLocation = null;
    }
    return currentLocation;
  }
}