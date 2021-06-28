import 'package:http/http.dart' as http;

import 'dart:convert';

class WeatherData {
  String name;
  String stat;
  String icon;
  double temp;
  String time;

  double feel;
  double speed;
  double pressure; //mBar
  int humidity;
  int rise;
  int set;

  WeatherData({this.time, this.name, this.temp, this.stat, this.icon}); //this.name

  Future<void> getData() async {
    // make a request
    http.Response response = await http.get(
        Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=$name&appid=c2397a293bad6bf5af8760b6e4207dfb'
        )
    );
    print(response.body);
    Map data = jsonDecode(response.body);

    //Extract Data
    time = new DateTime.fromMillisecondsSinceEpoch(data['dt'] * 1000, isUtc: false).toString();
    name = data['name'];

    temp = data['main']['temp'].toDouble();
    stat = data['weather'][0]['main'];
    icon = data['weather'][0]['icon'];

    feel = data['main']['feels_like'].toDouble();
    speed = data['wind']['speed'];
    pressure = data['main']['pressure'].toDouble();
    humidity = data['main']['humidity'].toInt();
    rise = data['sys']['sunrise'];
    set = data['sys']['sunset'];
  }
}

