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
