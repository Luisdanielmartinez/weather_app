import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/src/services/weather_service.dart';
import 'package:weather_app/src/util/contains.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String currentCity = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('Weather app'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Container(
              child: FlareActor(
                "assets/WorldSpin.flr",
                fit: BoxFit.contain,
                animation: 'roll',
              ),
              height: 300,
              width: 300,
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 32, right: 32),
            child: Column(
              children: <Widget>[
                Text(
                  'Search Weather',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w500,
                      color: Colors.white70),
                ),
                Text(
                  'Instanly',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w200,
                      color: Colors.white70),
                ),
                SizedBox(
                  height: 24,
                ),
                TextFormField(
                  decoration: textInputDecoration,
                  style: TextStyle(color: Colors.white70),
                  onChanged: (val) {
                    setState(() {
                      currentCity = val;
                    });
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: GetBuilder<WeatherService>(
                    init: WeatherService(),
                    builder: (WeatherService weatherService) {
                      return FlatButton(
                        shape: new RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        onPressed: () async {
                          dynamic result = await Get.find<WeatherService>()
                              .getWeatherByCity(currentCity);
                          print("city $currentCity");
                          print('resultado $result');
                          if (result != null) {
                            Get.toNamed('/showWeather');
                          } else {
                            Get.snackbar("Error", "Intente mas tarde");
                          }
                        },
                        color: Colors.lightBlue,
                        child: Text(
                          'Search',
                          style: TextStyle(color: Colors.white70, fontSize: 16),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
