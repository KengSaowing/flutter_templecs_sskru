import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:temple/bar.dart';


class Login extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      new Container(
                        height: 100.0,
                        width: 100.0,
                        decoration: new BoxDecoration(
                            borderRadius: new BorderRadius.circular(50.0),
                            color:  Color(0xFF18D191)
                        ),
                        child: new Icon(Icons.local_offer,color: Colors.white,),
                      ),
                      new Container(
                        margin: new EdgeInsets.only(left: 0.0,top: 150.0),
                        height: 100.0,
                        width: 100.0,
                        decoration: new BoxDecoration(
                            borderRadius: new BorderRadius.circular(50.0),
                            color:  Color(0xFFFFCE56)
                        ),
                        child: new Icon(Icons.local_car_wash,color: Colors.white,),
                      ),
                      new Container(
                        margin: new EdgeInsets.only(right: 130.0,top: 60.0),
                        height: 100.0,
                        width: 100.0,
                        decoration: new BoxDecoration(
                            borderRadius: new BorderRadius.circular(50.0),
                            color:  Color(0xFFFC6A7F)
                        ),
                        child: new Icon(Icons.home,color: Colors.white,),
                      ),
                      new Container(
                        margin: new EdgeInsets.only(left: 130.0,top: 60.0),
                        height: 100.0,
                        width: 100.0,
                        decoration: new BoxDecoration(
                            borderRadius: new BorderRadius.circular(50.0),
                            color:  Color(0xFF45E0EC)
                        ),
                        child: new Icon(Icons.place,color: Colors.white,),
                      ),
                    ]
                ),
                new Row(
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
                  height: 100, color: Colors.white ,
                ),
                SignInButton(
                  Buttons.Google,
                  onPressed: ()
                  {
                    _googleSignUp();
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>Launcher())
                    );
                  },
                ),
                Divider(
                  color: Colors.white,
                ),
                  SignInButton(
                   Buttons.Facebook,
                    onPressed: () {
                       Navigator.push(
                         context,
                       MaterialPageRoute(builder: (context) =>Launcher())
              );
            },
                  ),

              ],
            ),
        ),
    );


  }

  Future<void> _googleSignUp() async {
    try {
      final GoogleSignIn _googleSignIn = GoogleSignIn(
        scopes: [
          'email'
        ],
      );
      final FirebaseAuth _auth = FirebaseAuth.instance;

      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final FirebaseUser user = (await _auth.signInWithCredential(credential)).user;
      print("signed in " + user.displayName);

      return user;
    }catch (e) {
      print(e.message);
    }
  }
}






