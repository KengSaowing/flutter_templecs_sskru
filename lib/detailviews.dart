import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as Http;
import 'package:maps_launcher/maps_launcher.dart';
import 'dart:convert';
import 'package:temple/json.dart';



class ShowPage extends StatefulWidget {
  ShowPage({Key key, this.title}) : super(key: key);
  final String title;
  int templeID;

  @override
  _ShowPageState createState() => _ShowPageState();
}

class _ShowPageState extends State<ShowPage> {
  var jsonData;
  int temple_id;
  templessk obj;

  Future<String> _getTemple() async {
    var response = await Http.get(
      "http://templecs.herokuapp.com/api/temple/"+temple_id.toString(),
    );

    jsonData = json.decode(utf8.decode(response.bodyBytes));
    print(jsonData);
    return "ok";
  }

  @override
  Widget build(BuildContext context) {
    //Get value from previous page
    obj = ModalRoute.of(context).settings.arguments;
    setState(() {
      temple_id = obj.id;
    });

    return Scaffold(
       appBar: new AppBar(
          backgroundColor: Colors.orange,
          title: new Text('แหล่งรวมวัดในจังหวัดศรีสะเกษ'),
        ),
      body: Card(
        child: FutureBuilder(
            future: _getTemple(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context ,index){
                      return Card(
                        child: new Container(
                          padding: new EdgeInsets.all(32.0),
                          child: new Column(
                            children: <Widget>[
                              new Image.network('https://res.cloudinary.com/https-templeinsisaket-herokuapp-com/'+obj.img_url),
                              new Divider(
                                  height: 5, color: Colors.white ,
                                  ),
                              new Text('${obj.name}',
                                  style: TextStyle(fontSize: 18)),
                              new Divider(
                                  height: 5, color: Colors.white ,
                                  ),
                              new Text(  'ชื่อเจ้าอาวาส :${obj.Monk}',
                                  style: TextStyle(fontSize: 16)),
                              new Divider(
                                  height: 5, color: Colors.white ,
                                  ),
                              new Row(children: [
                              new Text("ที่อยู่และรายละเอียด",
                                  style: TextStyle(fontSize: 18)),
                                  ],
                                ),
                              new Divider(
                                  height: 5, color: Colors.white ,
                                ),
                              new Text( '${obj.Details}',
                                  style: TextStyle(fontSize: 16) ),
                              new Text( '${obj.Detailsa}',
                                  style: TextStyle(fontSize: 16) ),
                              new Text( '${obj.Detailsb}',
                                  style: TextStyle(fontSize: 16) ),
                              new Text( 'ละติจูด :${obj.latitude}',
                                  style: TextStyle(fontSize: 16) ),
                              new Text( 'ลองติจูด :${obj.Longitude}',
                                  style: TextStyle(fontSize: 16) ),
                                  
                              new ButtonBar(
                                children: <Widget>[
                                  FlatButton(
                                    child: const Text('กลับ'),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) =>Listview())
                                      );
                                    },
                                  ),
                                  FlatButton(
                                    textColor: Colors.greenAccent,
                                    child: const Text('เปิดการนำทาง'),
                                    onPressed: () => MapsLauncher.launchQuery(
                                      '${obj.name}',   )
                                      ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                );
              }
              else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }
        ),
      ),
    );
  }
}
