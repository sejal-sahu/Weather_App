import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:convert';

class WeatherData {
  String name;
  String stat;
  String icon;
  double temp;
  String time;

  double feel;
  double speed;
  double pressure; //mbar
  int humidity;
  int rise;
  int set;

  // bool isDayTime;

  WeatherData(
      {this.time, this.name, this.temp, this.stat, this.icon}); //this.name

  Future<void> getTime() async {
    // make a request
    // print('abc');
    // http.Response response = await http.get(Uri.https('api.openweathermap.org',
    //     '/data/2.5/weather?q=$name&appid=c2397a293bad6bf5af8760b6e4207dfb'));
    http.Response response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$name&appid=c2397a293bad6bf5af8760b6e4207dfb'));
    // http.Response response = await http.get(Uri.http(
    //     'http://api.openweathermap.org',
    //     '/data/2.5/weather?q=$name&appid=c2397a293bad6bf5af8760b6e4207dfb'));

    print('kyuuuu');
    print(response.body);
    Map data = jsonDecode(response.body);
    /*WeatherData({this.date, this.name, this.temp, this.main, this.icon});
  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      date: new DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000, isUtc: false),
      name: json['name'],
      temp: json['main']['temp'].toDouble(),
      main: json['weather'][0]['main'],
      icon: json['weather'][0]['icon'],
    );
  }
  */

    time =
        new DateTime.fromMillisecondsSinceEpoch(data['dt'] * 1000, isUtc: false)
            .toString();
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
    print(feel);
    print(name);
    print(temp);
    print(stat);
    print('huehuehue');
    print(rise);
    print(set);
    print(icon);
    print(pressure);
    print(humidity);
    print(speed);
  }
}
