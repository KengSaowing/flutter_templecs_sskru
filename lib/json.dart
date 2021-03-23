import 'dart:core';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as Http;
import 'dart:convert';

import 'package:temple/detailviews.dart';

class long extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'แหล่งรวมวัดในจังหวัดศรีสะเกษ'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<templessk> dataList = [];
  var jsonData;

  Future<String> _getCheckedIn() async {
    var response = await Http.get(
      "http://templecs.herokuapp.com/api/temple",
    );

    jsonData = json.decode(utf8.decode(response.bodyBytes));
    print(jsonData);
    for (var u in jsonData) {
      print(u);
      templessk temple = templessk(u['id'], u['name'], u['image'], u['Monk'], u['Details'],u['Detailsa'],u['Detailsb'],u['Caregory']);

      dataList.add(temple);
    }
    return "ok";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: FutureBuilder(
            future: _getCheckedIn(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  padding: const EdgeInsets.all(10.0),
                  itemCount: dataList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: new InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ShowPage(),
                              settings: RouteSettings(
                                arguments: dataList[index],
                              ),
                            ),
                          );
                        },
                        child: ListTile(
                          leading:Image.network('https://res.cloudinary.com/https-templeinsisaket-herokuapp-com/'+dataList[index].img_url),
                          title: Text(
                              '${dataList[index].name} ',
                          ),
                          trailing: Text(
                            '${dataList[index].Category}',
                          ),
                        ),
                      ),
                    );
                  },
                );

              } else {
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

class templessk {
  int id;
  String name;
  String Monk;
  String Details;
  String img_url;
  String Detailsa;
  String Detailsb;
  String Category;

  templessk(this.id, this.name, this.img_url ,this.Monk,this.Details,this.Detailsa,this.Detailsb,this.Category,);

}

