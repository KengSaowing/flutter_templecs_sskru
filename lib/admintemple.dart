import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';

class Webbrowser2 extends StatefulWidget {
  @override
  _Webbrowser2State createState() => new _Webbrowser2State();
}

class _Webbrowser2State extends State<Webbrowser2> {
  openBrowserTab() async {
    await FlutterWebBrowser.openWebPage(url: "https://templecs.herokuapp.com/admin/login/");
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.orange,
          title: new Text('แหล่งรวมวัดในจังหวัดศรีสะเกษ'),
          
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new Divider(
                  height: 10, color: Colors.white ,
                ),
              new Column(
                children:<Widget> [
                  new Divider(
                  height: 200, color: Colors.white ,
                ),
                  new Text("ท่านต้องการไปหน้า admin ให้กดยืนยัน",
                style: TextStyle(fontSize: 20)),
                new Divider(
                  height: 50, color: Colors.white ,
                ),
                ],
              ),
         Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
              if (Platform.isAndroid) ...[
          new Column(
            children:<Widget> [
                RaisedButton(
                  onPressed: () {
                    FlutterWebBrowser.openWebPage(
                      url: "https://templecs.herokuapp.com/admin/login/",
                      customTabsOptions: CustomTabsOptions(
                        colorScheme: CustomTabsColorScheme.dark,
                        toolbarColor: Colors.orange,
                        secondaryToolbarColor: Colors.green,
                        navigationBarColor: Colors.black,
                        addDefaultShareMenuItem: true,
                        instantAppsEnabled: true,
                        showTitle: true,
                        urlBarHidingEnabled: true,
                      ),
                      safariVCOptions: SafariViewControllerOptions(
                      barCollapsingEnabled: true,
                      preferredBarTintColor: Colors.green,
                      preferredControlTintColor: Colors.amber,
                      dismissButtonStyle: SafariViewControllerDismissButtonStyle.close,
                      modalPresentationCapturesStatusBarAppearance: true,
  ),
                    );
                  },
                  color: Colors.green,
                  child: Text('กดยืนยันเพื่อไปหน้า Admin',style: TextStyle(color: Colors.white ,fontSize: 20)
    ),
                ),
            ]
          ),
              ],
            ],
          ),
          ],
          ), 
          ),
        ),
      );
  }
}
