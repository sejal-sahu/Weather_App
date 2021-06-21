import 'dart:ffi';
import 'package:flutter/material.dart';
import 'weatherData.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  static const routeName = '/home';
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  WeatherData data = new WeatherData(name: "kota");
  final _text = TextEditingController();
  void getData() async {
    print('kk');
    await data.getTime();
    print('jj');
    setState(() {});
  }

  void initState() {
    //super.initState();
    data.getTime();
    getData(); }

  void handleClick(String value) {
    switch (value) {
      case 'Logout':
        break;
      case 'Settings':
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    print(data.time);
    print(data.temp);
    print(data.stat);
    print(data.icon);
     var time1 = DateTime.parse(data.time);
   var timezone= DateFormat('yyyy-MM-dd kk:mm:ss').format(time1);
print(timezone);
var t1 = data.temp;
   double temper = ( t1 -273.15);
   var tempera = double.parse((temper).toStringAsFixed(2));
    // data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    //return Image(image: AssetImage('graphics/background.png'));
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
            title: Text('Weather app'),
            centerTitle: true,
            backgroundColor: Colors.blueGrey,
            leading: Icon(
              Icons.add_location_alt_outlined,
            )),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/cloudy.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                margin:
                    EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 50),
                padding:
                    EdgeInsets.only(left: 5, top: 5, right: 20, bottom: 00),
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(3),
                      topRight: Radius.circular(3),
                      bottomLeft: Radius.circular(3),
                      bottomRight: Radius.circular(3)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: new Icon(Icons.search),
                      onPressed: () {
                         setState(() {
                              data.name= _text.text;
                               
                              
                              data.getTime();
                        });
                      },
                    ),
                    SizedBox(width: 10),
                    Expanded(
                        child: TextField(
                      controller: _text,

                      decoration:
                          InputDecoration.collapsed(hintText: "Enter City"),

                      // onSubmitted: (String city) =>
                      //     {model.refreshWeather(city, context)})),
                    ))
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Column(
                      children: <Widget>[
                        Text('${data.name.toString()}',
                            style:
                                TextStyle(color: Colors.white, fontSize: 30)),

                        Text('${tempera.toString()}°C',
                            style: new TextStyle(
                                color: Colors.white,
                                fontSize: 64.0,
                                fontWeight: FontWeight.bold)),
                        Text('${data.stat.toString()}',
                            style: new TextStyle(
                                color: Colors.white, fontSize: 40.0)),
                        Image.network(
                        'https://openweathermap.org/img/w/${data.icon}.png'),
                        Text('${timezone.toString()}',
                            style: new TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
