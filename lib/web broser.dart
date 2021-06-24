import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:temple/json.dart';

class Webbrowser extends StatefulWidget {
  @override
  _WebbrowserState createState() => new _WebbrowserState();
}

class _WebbrowserState extends State<Webbrowser> {
  openBrowserTab() async {
    await FlutterWebBrowser.openWebPage(url: "https://templecs.herokuapp.com/");
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
              new Stack(
              alignment: Alignment.center,
              children: <Widget>[ 
          CarouselSlider(
              items: [
                //1st Image of Slider
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage("https://my.kapook.com/imagescontent/fb_img/526/s_129139_3857.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                  
                //2nd Image of Slider
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage("https://content.shopback.com/th/wp-content/uploads/2019/03/18113320/Pic-31.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                  
                //3rd Image of Slider
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage("https://tripth.com/wp-content/uploads/2020/10/DSC01658.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                  
                //4th Image of Slider
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage("https://cdn.shortpixel.ai/client/to_avif,q_glossy,ret_img,w_700/https://www.diyinspirenow.com/wp-content/uploads/2020/12/03-min.jpeg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                  
                //5th Image of Slider
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage("https://cdn.shortpixel.ai/client/to_avif,q_glossy,ret_img,w_700/https://www.diyinspirenow.com/wp-content/uploads/2020/12/07-min.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
  
          ],
            //Slider Container properties
              options: CarouselOptions(
                height: 180.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
          ),
              ]
              ),
              new Divider(
                  height: 10, color: Colors.white ,
                ),
              new Column(
                children:<Widget> [
                  new Text("วัดในจังหวัดศรีสะเกษ",
                style: TextStyle(fontSize: 20)),
                new Divider(
                  height: 10, color: Colors.white ,
                ),
                Row(children: [
                   Padding(
                        padding: const EdgeInsets.only(left: 20.0,right: 10.0),
                 child: Text("มีวัดอยู่ 2 ประเภทได้แก่", style: TextStyle(fontSize: 16)),
                   ),
                ]
                ),
                new Divider(
                  height: 10, color: Colors.white ,
                ),
                Row(children: [
                   Padding(
                        padding: const EdgeInsets.only(left: 20.0,right: 10.0),
                 child: Text("1.วัดพระอารามหลวง มี 2 ประเภท ได้แก่", style: TextStyle(fontSize: 18)),
                   ),
                ],
                ),
                
                 Row(children: [
                   Padding(
                        padding: const EdgeInsets.only(left: 20.0,right: 10.0),
                 child: Text("1.1 พระอารามหลวงมหานิกาย", style: TextStyle(fontSize: 16)),
                   ),
                ],
                ),

                Row(children: [
                   Padding(
                        padding: const EdgeInsets.only(left: 20.0,right: 10.0),
                 child: Text("1.2 พระอารามหลวงธรรมยุติกนิกาย", style: TextStyle(fontSize: 16)),
                   ),
                ],
                ),
                new Divider(
                  height: 5, color: Colors.white ,
                ),
                 Row(children: [
                   Padding(
                        padding: const EdgeInsets.only(left: 20.0,right: 10.0),
                 child: Text("2.วัดราษฏร์ มี 2 ประเภท ได้แก่", style: TextStyle(fontSize: 18)),
                   ),
                ],
                ),

                 Row(children: [
                   Padding(
                        padding: const EdgeInsets.only(left: 20.0,right: 10.0),
                 child: Text("2.1 วัดราษฏร์มหานิกาย", style: TextStyle(fontSize: 16)),
                   ),
                ],
                ),

                 Row(children: [
                   Padding(
                        padding: const EdgeInsets.only(left: 20.0,right: 10.0),
                 child: Text("2.1 วัดราษฏร์ธรรมยุติกนิกาย", style: TextStyle(fontSize: 16)),
                   ),
                ],
                ),
                ],
              ),
              
              new Divider(
                  height: 60, color: Colors.white ,
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
                      url: "https://templecs.herokuapp.com/",
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
                  child: Text('ค้นหาวัด',style: TextStyle(color: Colors.white ,fontSize: 25)
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
