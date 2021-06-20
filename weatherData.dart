import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:convert';

class WeatherData {
  final String name;
  String stat;
  String icon;
  double temp;
  String time;
  bool isDayTime;

  WeatherData(this.name);

  Future<void> getTime() async {
    // make a request
    http.Response response = await http.get(Uri.https(
        'https://api.openweathermap.org/data/2.5/weather?q=$name',
        '&appid=c2397a293bad6bf5af8760b6e4207dfb'));
    Map data = jsonDecode(response.body);

    // get properties from json
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1, 3);
    String offset_min = data['utc_offset'].substring(4, 6);

    // create DateTime object
    DateTime now = DateTime.parse(datetime);
    now = now.add(
        Duration(hours: int.parse(offset), minutes: int.parse(offset_min)));

    // set time

    isDayTime = now.hour < 20 && now.hour > 5;
    time = DateFormat.jm().format(now);
    temp = data['main']['temp'].toDouble();
    stat = data['weather'][0]['main'];
    icon = data['weather'][0]['icon'];
  }
}
