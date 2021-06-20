import 'package:flutter/material.dart';
import '../services/weatherData.dart';
// import 'package:world_clock/Services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WeatherData> locations = [
    WeatherData(url: 'Asia/Kolkata', location: 'India', flag: 'india.png'),
    WeatherData(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WeatherData(url: 'Europe/Athens', location: 'Athens', flag: 'greece.png'),
    WeatherData(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WeatherData(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WeatherData(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WeatherData(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WeatherData(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WeatherData(
        url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  void UpdateTime(index) async {
    WeatherData instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'time': instance.time,
      'flag': instance.flag,
      'isDayTime': instance.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: () {
                UpdateTime(index);
              },
              title: Text(locations[index].location),
              // leading: CircleAvatar(
              // backgroundImage: AssetImage('assets/${locations[index].flag}'),
            ),
          );
        },
      ),
    );
  }
}
