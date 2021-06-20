import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:convert';

class WeatherData {
  String name;
  String stat;
  String icon;
  double temp;
  String time;
  // bool isDayTime;

  WeatherData(this.name);

  Future<void> getTime() async {
    // make a request
    print('abc');
    http.Response response = await http.get(Uri.https('api.openweathermap.org',
        '/data/2.5/weather?q=$name&appid=c2397a293bad6bf5af8760b6e4207dfb'));
    print('kyuuuu');
    print(response.body);
    Map data = jsonDecode(response.body);

    time =
        new DateTime.fromMillisecondsSinceEpoch(data['dt'] * 1000, isUtc: false)
            .toString();
    temp = data['main']['temp'].toDouble();
    stat = data['weather'][0]['main'];
    icon = data['weather'][0]['icon'];
    print(time);
    print(temp);
    print(stat);
    print(icon);
  }
}
