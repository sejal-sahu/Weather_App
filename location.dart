import 'package:flutter/material.dart';
import 'weatherData.dart';
import 'package:intl/intl.dart';
import 'location.dart';
import 'forecast.dart';
import './home_screen.dart';

class location extends StatelessWidget {
  Function setState;
  Function getTime;
  WeatherData data = new WeatherData(name: "Delhi");
  String abc;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
          title: Text("Select Location"),
          backgroundColor: Colors.blueGrey,
          leading: RaisedButton(
              child: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              })),
      body: Card(
        child: Column(children: <Widget>[
          TextField(
              decoration: InputDecoration(labelText: 'Enter City'),
              onChanged: (value) {
                //WeatherData obj = new WeatherData(name: value);
                //setState(() {});
                abc = value;
              }),

          /* setState(() {
                  obj.name = value;
                  print(value + "yehi haiiiii");
                  obj.getTime();
                });
                Navigator.pop(context);
              }),*/
          RaisedButton(
            child: Text('Search'),
            textColor: Colors.white,
            onPressed: () {
              setState(
                () {
                  WeatherData data = new WeatherData(name: abc);
                  FData d = new FData(name: abc);
                  data.name = abc;
                  print(abc + "yehi haiiiii");
                  data.getTime();
                  Navigator.pop(context);
                },
              );
            },
          )
        ]),
      ),
    );
  }
}

/* mainAxisSize: MainAxisSize.max,
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
                  children: [*/
/*     TextField(
                      //icon: new Icon(Icons.search),
                      onChanged: (value) {
                           WeatherData(name: value);
                      }
                    
                    FlatButton(
                    child: Text('AddTransaction'),
                    textColor: Colors.purple,
                    onPressed: () {},
                  ),
                         //Navigator.pop(context);
                        /*setState(() {
                          data.name = _text.text;

                          data.getTime();

                          FocusScope.of(context).requestFocus(FocusNode());
                        });*/
                      },
                    ),
                    SizedBox(width: 10),
                    Expanded(
                        child: TextField(
                      //controller: _text,

                      decoration:
                          InputDecoration.collapsed(hintText: "Enter City"),

                      // onSubmitted: (String city) =>
                      //     {model.refreshWeather(city, context)})),
                    ))
                  ],
                ),
              ),
  }
}
*/
