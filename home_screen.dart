import 'package:flutter/material.dart';
import 'weatherData.dart';

class Home extends StatefulWidget {
  static const routeName = '/home';
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //static int j=0;
//if(j==0)  
WeatherData data = new WeatherData(name: 'kota');
  final _text = TextEditingController();
  void getData() async {
    print('hello');
    await data.getTime();
    print('jj');
    setState(() {});
  }

  /*@override
  void initState() {
    super.initState();
    getData(); 
    {
      
  
    setState(() {
    
    
      WeatherData newdata = new WeatherData(_text.text);
                              newdata.getTime();
                              data = newdata;
    });
    }*/
    
    // print('kuch');
  //}
  

  @override
  Widget build(BuildContext context) {
    print(data.time);
    print(data.temp);
    print(data.stat);
    print(data.icon);
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
                        Text('${data.name.toString()}',
                            style: new TextStyle(color: Colors.white)),
                        Text('${data.stat.toString()}',
                            style: new TextStyle(
                                color: Colors.white, fontSize: 32.0)),
                        Text('${data.temp.toString()}°C',
                            style: new TextStyle(color: Colors.white)),
                         Image.network(
                         'https://openweathermap.org/img/w/${data.icon}.png'),
                        Text('${data.time.toString()}' ,
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

                  // Padding(
                  //     padding: const EdgeInsets.all(8),
                  //     child: TextField(
                  //       controller: _text,
                  //     )),
                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, right: 20, bottom: 50),
                    padding:
                        EdgeInsets.only(left: 5, top: 5, right: 20, bottom: 00),
                    height: 50,
                    width: 200,
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
                           // WeatherData newdata = new WeatherData(name: _text.text);
                              //data = newdata;
    
                            //   print("object");
                            // newdata.getTime();
                           
                            setState(() {
                              data.name= _text.text;
                               //WeatherData newdata = new WeatherData(name: _text.text);
                             
                               //data = newdata;
                              
                              data.getTime();
                              
                             
                            });
                          }
                        ),
                        SizedBox(width: 10),
                        Expanded(
                            child: TextField(
                          controller: _text,
                          decoration:
                              InputDecoration.collapsed(hintText: "Enter City"),
                          // onSubmitted: (String city) =>
                          //     {model.refreshWeather(city, context)} //)),
                        ))
                      ],
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: TextButton(
                  //     child: new Text('Search'),
                  //     // tooltip: 'Refresh',
                  //     onPressed: () {
                  // setState(() {
                  //   WeatherData new_data = new WeatherData(_text.text);
                  //   // data = new WeatherData(_text.text);
                  //   new_data.getTime();
                  //   data = new_data;
                  // });
                  //     },
                  //     // color: Colors.white,
                  //   ),
                  // ),
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
