import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/src/services/weather_service.dart';

class ShowWeather extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('Show Weather'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 10, right: 30, left: 30),
        child: GetBuilder(builder: (WeatherService weatherService) {
          return Column(
            children: <Widget>[
              Text(
                'Nombre de la ciudad',
                style: TextStyle(
                    color: Colors.white70,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                weatherService.weather.getTemp.round().toString() + "C",
                style: TextStyle(color: Colors.white70, fontSize: 50),
              ),
              Text(
                "Temprature",
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        weatherService.weather.getMinTem.round().toString() +
                            "C",
                        style: TextStyle(color: Colors.white70, fontSize: 30),
                      ),
                      Text(
                        "Min Temprature",
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        weatherService.weather.getMaxTemp.round().toString() +
                            "C",
                        style: TextStyle(color: Colors.white70, fontSize: 30),
                      ),
                      Text(
                        "Max Temprature",
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      )
                    ],
                  ),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  // Container(
                  //   width: double.infinity,
                  //   height: 50,
                  //   child: FlatButton(
                  //     shape: new RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.all(Radius.circular(10))),
                  //     onPressed: () {},
                  //     color: Colors.lightBlue,
                  //     child: Text(
                  //       "Search",
                  //       style: TextStyle(color: Colors.white70, fontSize: 16),
                  //     ),
                  //   ),
                  // )
                ],
              )
            ],
          );
        }),
      ),
    );
  }
}
