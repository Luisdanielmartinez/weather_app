import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/src/screens/home_page.dart';
import 'package:weather_app/src/screens/show_weather.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        theme: ThemeData(primarySwatch: Colors.blue),
        initialRoute: '/home',
        getPages: [
          //Simple GetPage
          GetPage(name: '/home', page: () => Home()),
          GetPage(name: '/showWeather', page: () => ShowWeather()),
        ]);
  }
}
