import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:temple/bar.dart';


class Login extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                 new Divider(
                  height: 50, color: Colors.white ,
                ),
                new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.only(left: 20.0,right: 10.0,top: 50),
                        child: new Text("แหล่งรวมวัดในจังหวัดศรีสะเกษ",style: new TextStyle(fontSize: 24.0),
                        )
                    )
                  ],
                ),
                 new Divider(
                  height: 50, color: Colors.white ,
                ),
                  new Stack(
                    alignment: Alignment.center,

                    children: <Widget>[
                      new Container(
                        child:Image.network("https://i.pinimg.com/736x/94/2d/e6/942de6bcb157ceaa211b80ce784846c6.jpg"),
                          ),
                       
                    ]
                ),
                new Divider(
                  height: 100, color: Colors.white ,
                ),
                 FlatButton(
                    padding: EdgeInsets.all(20),
                    onPressed: () { 
                     Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>Launcher())
                    );
                   },
                  child:Text("เข้าสู้ระบบ") ,
                  color: Colors.orange,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)
        ),
        ),
                  ),
              ],
            ),
        ),
    );
  }
}






