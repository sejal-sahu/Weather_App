import 'package:http/http.dart' as http;

import 'dart:convert';

class FData {
  String name;
  var stat = [];
  var icon = [];
  var temp = [];
  var date = [];

  FData({this.name});

  Future<void> getData() async {
    http.Response response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/forecast?q=$name&appid=c2397a293bad6bf5af8760b6e4207dfb'));
    // print(response.body);
    Map data = jsonDecode(response.body);

    name = data['name'];

    temp.add(data['list'][7]['main']['temp'].toDouble());
    temp.add(data['list'][15]['main']['temp'].toDouble());
    temp.add(data['list'][23]['main']['temp'].toDouble());
    temp.add(data['list'][31]['main']['temp'].toDouble());
    temp.add(data['list'][39]['main']['temp'].toDouble());

    stat.add(data['list'][7]['weather'][0]['main']);
    stat.add(data['list'][15]['weather'][0]['main']);
    stat.add(data['list'][23]['weather'][0]['main']);
    stat.add(data['list'][31]['weather'][0]['main']);
    stat.add(data['list'][39]['weather'][0]['main']);

    icon.add(data['list'][7]['weather'][0]['icon']);
    icon.add(data['list'][15]['weather'][0]['icon']);
    icon.add(data['list'][23]['weather'][0]['icon']);
    icon.add(data['list'][31]['weather'][0]['icon']);
    icon.add(data['list'][39]['weather'][0]['icon']);

    date.add(data['list'][7]['dt_txt'].toString());
    date.add(data['list'][15]['dt_txt'].toString());
    date.add(data['list'][23]['dt_txt'].toString());
    date.add(data['list'][31]['dt_txt'].toString());
    date.add(data['list'][39]['dt_txt'].toString());

    print(name);
  }
}
