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
    await d.getT();
    print('jj');
    setState(() {});
  }

  void initState() {
    super.initState();
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
    var timezone = DateFormat('EEE dd-MM-yyyy HH:mm:ss').format(time1);
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
      "Clouds": AssetImage("assets/images/clouds.jpg"),
      "Clear": AssetImage("assets/images/clear.jpg"),
      "Haze": AssetImage("assets/images/haze.jpg"),
      "Mist": AssetImage("assets/images/mist.jpg"),
      "Rain": AssetImage("assets/gifs/rain.gif"),
      "Thunderstorm": AssetImage("assets/gifs/thunderstorm.gif"),
      "Snow": AssetImage("assets/gifs/snow.gif"),
      "Drizzle": AssetImage("assets/gifs/drizzle.gif"),
    };
    final Map<String, AssetImage> night = {
      "Clouds": AssetImage("assets/night/clouds.jpg"),
      "Clear": AssetImage("assets/night/clear.jpg"),
      "Haze": AssetImage("assets/night/haze.jpg"),
      "Mist": AssetImage("assets/night/haze.jpg"),
      "Rain": AssetImage("assets/gifs/rain.gif"),
      "Thunderstorm": AssetImage("assets/gifs/thunderstorm.gif"),
      "Snow": AssetImage("assets/gifs/snow.gif"),
      "Drizzle": AssetImage("assets/gifs/drizzle.gif"),
    };
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        print('G');
      },
      child: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: Text('Weather Or Not'),
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
                    : (sr.compareTo(DateTime.now()) < 0) &&
                            ((ss.compareTo(DateTime.now()) > 0))
                        ? images[data.stat.toString()]
                        : night[data.stat.toString()],
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 2, top: 2, right: 2, bottom: 2),
                  padding:
                      EdgeInsets.only(left: 1, top: 1, right: 1, bottom: 1),
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
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
                            d.name = _text.text;
                            data.getTime();
                            d.getT();

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
                                      fontSize: 70.0,
                                      fontWeight: FontWeight.bold)),
                              Text('${data.stat.toString()}',
                                  style: new TextStyle(
                                      color: Colors.white, fontSize: 30.0)),
                              SizedBox(width: 30),
                              Image.network(
                                  'https://openweathermap.org/img/w/${data.icon}.png'),
                              Text('${timezone.toString()}',
                                  style: new TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20)),
                              SizedBox(height: 20),
                              Container(
                                margin: EdgeInsets.all(2),
                                alignment: Alignment.bottomCenter,
                                child: Card(
                                  //semanticContainer: true,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  elevation: 15,
                                  color: Colors.white.withOpacity(0.1),

                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      SizedBox(height: 30),
                                      Container(
                                        alignment: Alignment.bottomCenter,
                                        child: Row(
                                          children: [
                                            SizedBox(height: 20),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Text('Real Feel',
                                                    style: TextStyle(
                                                      color: Colors
                                                          .blueGrey.shade200,
                                                      fontSize: 20,
                                                    )),
                                                Text('${feels.toString()}°C',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 25))
                                              ],
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Text('  Wind Speed',
                                                    style: TextStyle(
                                                      color: Colors
                                                          .blueGrey.shade200,
                                                      fontSize: 20,
                                                    )),
                                                Text(
                                                    '${data.speed.toString()} km/h',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 25))
                                              ],
                                            )
                                          ],
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                        ),
                                        padding: EdgeInsets.all(10),
                                      ),
                                      SizedBox(height: 20),
                                      Container(
                                        child: Row(
                                          children: [
                                            Column(
                                              children: [
                                                Text('Pressure',
                                                    style: TextStyle(
                                                      color: Colors
                                                          .blueGrey.shade200,
                                                      fontSize: 20,
                                                    )),
                                                Text(
                                                    '${pressUre.toString()} mbar',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 25))
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Text('Humidity',
                                                    style: TextStyle(
                                                      color: Colors
                                                          .blueGrey.shade200,
                                                      fontSize: 20,
                                                    )),
                                                Text(
                                                    '${data.humidity.toString()}%',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 25))
                                              ],
                                            ),
                                          ],
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      Container(
                                        child: Row(
                                          children: [
                                            Column(
                                              children: [
                                                Text('Sunrise',
                                                    style: TextStyle(
                                                      color: Colors
                                                          .blueGrey.shade200,
                                                      fontSize: 20,
                                                    )),
                                                Text('${sunrise.toString()}',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 25))
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Text('  Sunset',
                                                    style: TextStyle(
                                                      color: Colors
                                                          .blueGrey.shade200,
                                                      fontSize: 20,
                                                    )),
                                                Text('${sunset.toString()}',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 25))
                                              ],
                                            )
                                          ],
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                        ),
                                        padding: EdgeInsets.all(10),
                                      ),
                                      SizedBox(height: 40),
                                      FlatButton(
                                        minWidth: 500,
                                        color: Colors.blueGrey.withOpacity(0.4),
                                        onPressed: () {},
                                        child: Text(
                                          "5-day forecast",
                                          style: TextStyle(
                                              fontSize: 25,
                                              color: Colors.white),
                                        ),
                                      ),
                                      SizedBox(height: 50),
                                      SizedBox(
                                        height: 200.0,
                                        width: 800,
                                        child: ListView(
                                            scrollDirection: Axis.horizontal,
                                            children: [
                                              Center(
                                                  child: Row(
                                                children: [
                                                  SizedBox(height: 50),
                                                  SizedBox(
                                                    height: 400,
                                                    width: 100,
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                            '${DateConvert(d.date1)}',
                                                            style: TextStyle(
                                                                fontSize: 18,
                                                                color: Colors
                                                                    .white)),
                                                        Text(
                                                            '${tempConvert(d.temp1).toString()}°C',
                                                            style: TextStyle(
                                                                fontSize: 20,
                                                                color: Colors
                                                                    .white)),
                                                        Image.network(
                                                            'https://openweathermap.org/img/w/${d.icon1}.png'),
                                                        Text(
                                                            '${d.stat1.toString()}',
                                                            style: TextStyle(
                                                              fontSize: 20,
                                                              color:
                                                                  Colors.white,
                                                            )),
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
                                                                fontSize: 18,
                                                                color: Colors
                                                                    .white)),
                                                        Text(
                                                            '${tempConvert(d.temp2).toString()}°C',
                                                            style: TextStyle(
                                                                fontSize: 20,
                                                                color: Colors
                                                                    .white)),
                                                        Image.network(
                                                            'https://openweathermap.org/img/w/${d.icon2}.png'),
                                                        Text(
                                                            '${d.stat2.toString()}',
                                                            style: TextStyle(
                                                              fontSize: 20,
                                                              color:
                                                                  Colors.white,
                                                            )),
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
                                                                fontSize: 18,
                                                                color: Colors
                                                                    .white)),
                                                        Text(
                                                            '${tempConvert(d.temp3).toString()}°C',
                                                            style: TextStyle(
                                                                fontSize: 20,
                                                                color: Colors
                                                                    .white)),
                                                        Image.network(
                                                            'https://openweathermap.org/img/w/${d.icon3}.png'),
                                                        Text(
                                                            '${d.stat3.toString()}',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 20)),
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
                                                                fontSize: 18,
                                                                color: Colors
                                                                    .white)),
                                                        Text(
                                                            '${tempConvert(d.temp4).toString()}°C',
                                                            style: TextStyle(
                                                                fontSize: 20,
                                                                color: Colors
                                                                    .white)),
                                                        Image.network(
                                                            'https://openweathermap.org/img/w/${d.icon4}.png'),
                                                        Text(
                                                            '${d.stat4.toString()}',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 20)),
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
                                                                fontSize: 18,
                                                                color: Colors
                                                                    .white)),
                                                        Text(
                                                            '${tempConvert(d.temp5).toString()}°C',
                                                            style: TextStyle(
                                                                fontSize: 20,
                                                                color: Colors
                                                                    .white)),
                                                        Image.network(
                                                            'https://openweathermap.org/img/w/${d.icon5}.png'),
                                                        Text(
                                                            '${d.stat5.toString()}',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 20)),
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

