import 'package:http/http.dart' as http;

import 'dart:convert';

class FData {
  String name;
   
  String stat1;
  String stat2;
  String stat3;
  String stat4;
  String stat5;

  String icon1;
  String icon2;
  String icon3;
  String icon4;
  String icon5;

  double temp1;
  double temp2;
  double temp3;
  double temp4;
  double temp5;


  String date1;
  String date2;
  String date3;
  String date4;
  String date5;

  FData({this.name});

  Future<void> getDataf() async {
    http.Response response = await http.get(
      Uri.parse(
        'https://api.openweathermap.org/data/2.5/forecast?q=$name&appid=c2397a293bad6bf5af8760b6e4207dfb'
      )
    );
    print(response.body);
    Map data = jsonDecode(response.body);

    name = data['name'];

    temp1 = data['list'][7]['main']['temp'].toDouble();
    temp2 = data['list'][15]['main']['temp'].toDouble();
    temp3 = data['list'][23]['main']['temp'].toDouble();
    temp4 = data['list'][31]['main']['temp'].toDouble();
    temp5 = data['list'][39]['main']['temp'].toDouble();

     temp1= data['list'][7]['main']['temp'].toDouble();
    temp2= data['list'][15]['main']['temp'].toDouble();
    temp3= data['list'][23]['main']['temp'].toDouble();
    temp4= data['list'][31]['main']['temp'].toDouble();
    temp5= data['list'][39]['main']['temp'].toDouble();
    //
      stat1 = data['list'][7]['weather'][0]['main'];
      stat2 = data['list'][15]['weather'][0]['main'];
      stat3 = data['list'][23]['weather'][0]['main'];
      stat4 = data['list'][31]['weather'][0]['main'];
      stat5 = data['list'][39]['weather'][0]['main'];

      //
      icon1 = data['list'][7]['weather'][0]['icon'];
      icon2 = data['list'][15]['weather'][0]['icon'];
      icon3 = data['list'][23]['weather'][0]['icon'];
      icon4 = data['list'][31]['weather'][0]['icon'];
      icon5 = data['list'][39]['weather'][0]['icon'];

   
    date1= data['list'][7]['dt_txt'].toString();
    date2= data['list'][15]['dt_txt'].toString();
    date3= data['list'][23]['dt_txt'].toString();
    date4= data['list'][31]['dt_txt'].toString();
    date5= data['list'][39]['dt_txt'].toString();
    print(name);
  }
}

