import 'package:flutter/material.dart';
import '../services/weatherData.dart';

class Home extends StatefulWidget {
  static const routeName = '/home';
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  WeatherData data = new WeatherData("kota");
  final _text = TextEditingController();
  void getData() async {
    print('kk');
    await data.getTime();
    print('jj');
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
    // print('kuch');
  }

  @override
  Widget build(BuildContext context) {
    // data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text('Weather app'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Text(data.name,
                            style: new TextStyle(color: Colors.white)),
                        Text(data.stat,
                            style: new TextStyle(
                                color: Colors.white, fontSize: 32.0)),
                        Text(data.temp.toString(),
                            style: new TextStyle(color: Colors.white)),
                        Image.network(data.icon),
                        Text(data.time,
                            style: new TextStyle(color: Colors.white)),
                        // Text('18:30',
                        //     style: new TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: IconButton(
                  //     icon: new Icon(Icons.refresh),
                  //     tooltip: 'Refresh',
                  //     onPressed: () => null,
                  //     color: Colors.white,
                  //   ),
                  // ),

                  Padding(
                      padding: const EdgeInsets.all(8),
                      child: TextField(
                        controller: _text,
                      )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      child: new Text('Search'),
                      // tooltip: 'Refresh',
                      onPressed: () {
                        setState(() {
                          WeatherData new_data = new WeatherData(_text.text);
                          new_data.getTime();
                          data = new_data;
                        });
                      },
                      // color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            // SafeArea(
            //   child: Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: Container(
            //       height: 200.0,
            //       child: ListView.builder(
            //           itemCount: 10,
            //           scrollDirection: Axis.horizontal,
            //           itemBuilder: (context, index) => Card(
            //                 child: Padding(
            //                   padding: const EdgeInsets.all(8.0),
            //                   child: Column(
            //                     mainAxisAlignment: MainAxisAlignment.center,
            //                     children: <Widget>[
            //                       Text('New York',
            //                           style:
            //                               new TextStyle(color: Colors.black)),
            //                       Text('Rain',
            //                           style: new TextStyle(
            //                               color: Colors.black, fontSize: 24.0)),
            //                       Text('72°F',
            //                           style:
            //                               new TextStyle(color: Colors.black)),
            //                       Image.network(
            //                           'https://openweathermap.org/img/w/01d.png'),
            //                       Text('Jun 28, 2018',
            //                           style:
            //                               new TextStyle(color: Colors.black)),
            //                       Text('18:30',
            //                           style:
            //                               new TextStyle(color: Colors.black)),
            //                     ],
            //                   ),
            //                 ),
            //               )),
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
