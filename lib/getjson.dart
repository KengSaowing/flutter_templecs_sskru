import 'dart:convert';

import 'package:http/http.dart' as Http;
 
class APIService {
  static templecs() async {
    var url = "https://templecs.herokuapp.com/api/temple";
    var response = await Http.get(url);
    var jsonData = jsonDecode(utf8.decode(response.bodyBytes));
    print("Response status: ${jsonData}");
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

  templessk(this.id, this.name, this.img_url ,this.Monk,this.Details,this.Detailsa,this.Detailsb);
  }