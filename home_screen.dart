import 'package:flutter/material.dart';
import 'weatherData.dart';
import 'package:intl/intl.dart';
import 'forecast.dart';

class Home extends StatefulWidget {
  static const routeName = '/home';
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  WeatherData data = new WeatherData(name: "Delhi");
  FData d = new FData(name: "Delhi");
  final _text = TextEditingController();
  void getData() async {
    print('kk');
    await data.getTime();
    d.getT();
    print('jj');
    setState(() {});
  }

  void initState() {
    //super.initState();
    data.getTime();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    print(data.feel);
    print('why');
    print(data.temp);
    print(data.stat);
    print(data.icon);
    print(data.pressure);
    print(data.humidity);
    print(data.speed);

    var time1 = DateTime.parse(data.time);
    var timezone = DateFormat('yyyy-MM-dd kk:mm:ss').format(time1);
    print(timezone);
    var t1 = data.temp;
    double temper = (t1 - 273.15);
    var tempera = temper.toInt();

    int tempConvert(double t) {
      double tempe = (t - 273.15);
      var temper = tempe.toInt();
      return temper;
    }

    String DateConvert(String date) {
      var tim = DateTime.parse(date);
      var timezone = DateFormat('dd-MM-yyyy').format(tim);
      return timezone;
    }

    //var tempera = double.parse((temper).toStringAsFixed(2));
    var feels;

    double windfeels = data.feel - 273.15;
    feels = windfeels.toInt();
    //feels= double.parse((windfeels).toStringAsFixed(0));
    var pressUre = data.pressure.toInt();

    var sr = DateTime.fromMillisecondsSinceEpoch(data.rise * 1000);
    var sunrise = DateFormat('HH:mm').format(sr);
    var ss = DateTime.fromMillisecondsSinceEpoch(data.set * 1000);
    var sunset = DateFormat('HH:mm').format(ss);

    print(sunrise);
    print('why same set');
    print(sunset);
    print('sunrise');

    final Map<String, AssetImage> images = {
      "Clouds": AssetImage("assets/images/cloudy.jpg"),
      "Clear": AssetImage("assets/images/clear.jpg"),
      "Haze": AssetImage("assets/images/haze.jpg"),
      "Mist": AssetImage("assets/images/mist.jpg"),
      "Rain": AssetImage("assets/gifs/rain.gif"),
      "Thunderstorm": AssetImage("assets/images/rain.jpg"),
      "Snow": AssetImage("assets/images/snow.jpg"),
    };

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        print('G');
      },
      child: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: Text('Weather app'),
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
        ),
        body: SingleChildScrollView(
          child: Container(
            //BACKGROUND IMAGE
            decoration: BoxDecoration(
              image: DecorationImage(
                image: (data.stat.toString()) == null
                    ? images["Clear"]
                    : images[data.stat.toString()],
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
                            data.name = _text.text;

                            data.getTime();

                            FocusScope.of(context).requestFocus(FocusNode());
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
                SingleChildScrollView(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Column(
                            children: <Widget>[
                              Text('${data.name.toString().toUpperCase()}',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 30)),
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
                              Container(
                                margin: EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 8,
                                ),
                                alignment: Alignment.bottomCenter,
                                child: Card(
                                  semanticContainer: true,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  elevation: 10,
                                  color: Colors.transparent,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        alignment: Alignment.bottomCenter,
                                        child: Row(
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Text('Real Feel',
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 20)),
                                                Text('${feels.toString()}°C',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 20))
                                              ],
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Text('Wind Speed',
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 20)),
                                                Text(
                                                    '${data.speed.toString()} km/h',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 20))
                                              ],
                                            )
                                          ],
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                        ),
                                        padding: EdgeInsets.all(10),
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Column(
                                              children: [
                                                Text('Pressure',
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 20)),
                                                Text(
                                                    '${pressUre.toString()} mbar',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 20))
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Text('Humidity',
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 20)),
                                                Text(
                                                    '${data.humidity.toString()}%',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 20))
                                              ],
                                            ),
                                          ],
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                        ),
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Column(
                                              children: [
                                                Text('Sunrise',
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 20)),
                                                Text('${sunrise.toString()}',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 20))
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Text('Sunset',
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 20)),
                                                Text('${sunset.toString()}',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 20))
                                              ],
                                            )
                                          ],
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                        ),
                                        padding: EdgeInsets.all(10),
                                      ),
                                      SizedBox(
                                        height: 200.0,
                                        width: 800,
                                        child: ListView(
                                            scrollDirection: Axis.horizontal,
                                            children: [
                                              Center(
                                                  child: Row(
                                                children: [
                                                  SizedBox(
                                                    height: 200,
                                                    width: 100,
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                            '${DateConvert(d.date1)}',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white)),
                                                        Text(
                                                            '${tempConvert(d.temp1).toString()}°C',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white)),
                                                        Image.network(
                                                            'https://openweathermap.org/img/w/${d.icon1}.png'),
                                                        Text(
                                                            '${d.stat1.toString()}',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 15)),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 200,
                                                    width: 100,
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                            '${DateConvert(d.date2)}',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white)),
                                                        Text(
                                                            '${tempConvert(d.temp2).toString()}°C',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white)),
                                                        Image.network(
                                                            'https://openweathermap.org/img/w/${d.icon2}.png'),
                                                        Text(
                                                            '${d.stat2.toString()}',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 15)),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 200,
                                                    width: 100,
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                            '${DateConvert(d.date3)}',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white)),
                                                        Text(
                                                            '${tempConvert(d.temp3).toString()}°C',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white)),
                                                        Image.network(
                                                            'https://openweathermap.org/img/w/${d.icon3}.png'),
                                                        Text(
                                                            '${d.stat3.toString()}',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 15)),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 200,
                                                    width: 100,
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                            '${DateConvert(d.date4)}',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white)),
                                                        Text(
                                                            '${tempConvert(d.temp4).toString()}°C',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white)),
                                                        Image.network(
                                                            'https://openweathermap.org/img/w/${d.icon4}.png'),
                                                        Text(
                                                            '${d.stat4.toString()}',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 15)),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 200,
                                                    width: 100,
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                            '${DateConvert(d.date5)}',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white)),
                                                        Text(
                                                            '${tempConvert(d.temp5).toString()}°C',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white)),
                                                        Image.network(
                                                            'https://openweathermap.org/img/w/${d.icon5}.png'),
                                                        Text(
                                                            '${d.stat5.toString()}',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 15)),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              )),
                                            ]),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
