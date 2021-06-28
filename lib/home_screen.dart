import 'package:flutter/material.dart';
import 'loading.dart';
import 'weatherData.dart';
import 'package:intl/intl.dart';
import 'forecast.dart';

class Home extends StatefulWidget {
  static const routeName = '/home';
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  WeatherData weatherData = new WeatherData(name: "Delhi");
  FData forecastData = new FData(name: "Delhi");
  bool _loading = true;
  final _text = TextEditingController();
  var temperature;
  var feels;
  var pressure;
  var sunrise;
  var sunset;
  var sunriseTime;
  var sunsetTime;
  var timezone;
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

  int tempConvert(double t) {
    double tempe = (t - 273.15);
    var temper = tempe.toInt();
    return temper;
  }

  void _setStateAlways() {
    setState(() {
      if (_text.text == '') return; //TODO Add more conditions
      _loading = true;
      weatherData.name = _text.text.toLowerCase();
      forecastData.name = _text.text.toLowerCase();
      getData();
      FocusScope.of(context).requestFocus(FocusNode());
    });
  }

  String dateConvert(String date) {
    var time = DateTime.parse(date);
    var timezone = DateFormat('dd MMMM').format(time);
    return timezone;
  }

  void getData() async {
    await weatherData.getData();
    await forecastData.getData();

    var time = DateTime.parse(weatherData.time);
    timezone = DateFormat('EEE, dd MMMM HH:mm').format(time);

    double temp = weatherData.temp - 273.15;
    temperature = temp.toInt();

    double windFeels = weatherData.feel - 273.15;
    feels = windFeels.toInt();

    pressure = weatherData.pressure.toInt();

    sunriseTime = DateTime.fromMillisecondsSinceEpoch(weatherData.rise * 1000);
    sunrise = DateFormat('HH:mm').format(sunriseTime);
    sunsetTime = DateTime.fromMillisecondsSinceEpoch(weatherData.set * 1000);
    sunset = DateFormat('HH:mm').format(sunsetTime);

    setState(() {
      _loading = false;
    });
  }

  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      return _loading
          ? Loading()
          : GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
                print('G');
              },
              child: Scaffold(
                //TODO PIXELS DONE
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
                        image: (weatherData.stat.toString()) == null
                            ? images["Clear"]
                            : (sunriseTime.compareTo(DateTime.now()) < 0) &&
                                    (sunsetTime.compareTo(DateTime.now()) > 0)
                                ? images[weatherData.stat.toString()]
                                : night[weatherData.stat.toString()],
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(
                            top: constraints.maxWidth * 0.08,
                          ),
                          padding:
                              EdgeInsets.all(constraints.maxWidth * 0.0025),
                          height: constraints.maxWidth * 0.126,
                          width: constraints.maxWidth * 0.8,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                constraints.maxWidth * 0.025,
                              ),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                spreadRadius: 3,
                                blurRadius: 5,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              IconButton(
                                icon: new Icon(Icons.search),
                                onPressed: _setStateAlways,
                              ),
                              SizedBox(width: constraints.maxWidth * 0.025),
                              Expanded(
                                child: TextField(
                                  onSubmitted: (_) => _setStateAlways(),
                                  //TODO Implement change weather on submission DONE
                                  controller: _text,
                                  decoration: InputDecoration.collapsed(
                                    hintText: "Enter City",
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.all(
                                    constraints.maxWidth * 0.035),
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      '${weatherData.name.toString().toUpperCase()}',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: constraints.maxWidth * 0.075,
                                      ),
                                    ),
                                    Text(
                                      '${temperature.toString()}°C',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize:
                                              constraints.maxWidth * 0.175,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '${weatherData.stat.toString()}',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: constraints.maxWidth * 0.075,
                                      ),
                                    ),
                                    SizedBox(
                                        width: constraints.maxWidth * 0.075),
                                    Image.network(
                                        'https://openweathermap.org/img/w/${weatherData.icon}.png'),
                                    Text(
                                      '${timezone.toString()}',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize:
                                              constraints.maxWidth * 0.05),
                                    ),
                                    SizedBox(
                                        height: constraints.maxWidth * 0.05),
                                    Container(
                                      margin: EdgeInsets.all(
                                          constraints.maxWidth * 0.005),
                                      alignment: Alignment.bottomCenter,
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              constraints.maxWidth * 0.025),
                                        ),
                                        elevation: 15,
                                        color: Colors.white.withOpacity(0.1),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            SizedBox(
                                                height: constraints.maxWidth *
                                                    0.075),
                                            Container(
                                              padding: EdgeInsets.all(
                                                  constraints.maxWidth * 0.025),
                                              alignment: Alignment.bottomCenter,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  SizedBox(
                                                      height:
                                                          constraints.maxWidth *
                                                              0.05),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        'Real Feel',
                                                        style: TextStyle(
                                                            color: Colors
                                                                .blueGrey
                                                                .shade200,
                                                            fontSize: constraints
                                                                    .maxWidth *
                                                                0.05),
                                                      ),
                                                      Text(
                                                        '${feels.toString()}°C',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: constraints
                                                                    .maxWidth *
                                                                0.0625),
                                                      ),
                                                      SizedBox(
                                                          height: constraints
                                                                  .maxWidth *
                                                              0.05),
                                                      Text(
                                                        'Pressure',
                                                        style: TextStyle(
                                                            color: Colors
                                                                .blueGrey
                                                                .shade200,
                                                            fontSize: constraints
                                                                    .maxWidth *
                                                                0.05),
                                                      ),
                                                      Text(
                                                        '${pressure.toString()} mBar',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: constraints
                                                                    .maxWidth *
                                                                0.0625),
                                                      ),
                                                      SizedBox(
                                                          height: constraints
                                                                  .maxWidth *
                                                              0.05),
                                                      Text(
                                                        'Sunrise',
                                                        style: TextStyle(
                                                          color: Colors.blueGrey
                                                              .shade200,
                                                          fontSize: constraints
                                                                  .maxWidth *
                                                              0.05,
                                                        ),
                                                      ),
                                                      Text(
                                                        '${sunrise.toString()}',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: constraints
                                                                    .maxWidth *
                                                                0.0625),
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        'Wind Speed',
                                                        style: TextStyle(
                                                            color: Colors
                                                                .blueGrey
                                                                .shade200,
                                                            fontSize: constraints
                                                                    .maxWidth *
                                                                0.05),
                                                      ),
                                                      Text(
                                                        '${weatherData.speed.toString()} km/h',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: constraints
                                                                    .maxWidth *
                                                                0.0625),
                                                      ),
                                                      SizedBox(
                                                          height: constraints
                                                                  .maxWidth *
                                                              0.05),
                                                      Text(
                                                        'Humidity',
                                                        style: TextStyle(
                                                          color: Colors.blueGrey
                                                              .shade200,
                                                          fontSize: constraints
                                                                  .maxWidth *
                                                              0.05,
                                                        ),
                                                      ),
                                                      Text(
                                                        '${weatherData.humidity.toString()}%',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: constraints
                                                                  .maxWidth *
                                                              0.0625,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: constraints
                                                                .maxWidth *
                                                            0.05,
                                                      ),
                                                      Text(
                                                        'Sunset',
                                                        style: TextStyle(
                                                          color: Colors.blueGrey
                                                              .shade200,
                                                          fontSize: constraints
                                                                  .maxWidth *
                                                              0.05,
                                                        ),
                                                      ),
                                                      Text(
                                                        '${sunset.toString()}',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: constraints
                                                                    .maxWidth *
                                                                0.0625),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                                height:
                                                    constraints.maxWidth * 0.1),
                                            Container(
                                              width: constraints.maxWidth * 0.8,
                                              color: Colors.blueGrey
                                                  .withOpacity(0.4),
                                              child: Center(
                                                child: Text(
                                                  "5-day forecast",
                                                  style: TextStyle(
                                                      fontSize:
                                                          constraints.maxWidth *
                                                              0.0625,
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                                height: constraints.maxWidth *
                                                    0.125),
                                            SizedBox(
                                              height:
                                                  constraints.maxWidth * 0.5,
                                              width: constraints.maxWidth * 0.9,
                                              child: ListView.builder(
                                                itemCount: 5,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemBuilder: (context, index) =>
                                                    Center(
                                                  child: Row(
                                                    children: [
                                                      SizedBox(
                                                        height: constraints
                                                                .maxWidth *
                                                            0.5,
                                                        width: constraints
                                                                .maxWidth *
                                                            0.265,
                                                        child: Column(
                                                          children: [
                                                            Text(
                                                              '${dateConvert(forecastData.date[index])}',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      constraints
                                                                              .maxWidth *
                                                                          0.045,
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                            Text(
                                                              '${tempConvert(forecastData.temp[index]).toString()}°C',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      constraints
                                                                              .maxWidth *
                                                                          0.05,
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                            Image.network(
                                                                'https://openweathermap.org/img/w/${forecastData.icon[index]}.png'),
                                                            Text(
                                                              '${forecastData.stat[index].toString()}',
                                                              style: TextStyle(
                                                                fontSize:
                                                                    constraints
                                                                            .maxWidth *
                                                                        0.05,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
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
                      ],
                    ),
                  ),
                ),
              ));
    });
  }
}


