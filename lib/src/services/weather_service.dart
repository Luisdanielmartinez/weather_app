import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:weather_app/src/models/weather.dart';

class WeatherService extends GetxController {
  Weather weather = null;
  Future<Weather> getWeatherByCity(String city) async {
    try {
      final result = await http.Client().get(
          "https://api.openweathermap.org/data/2.5/weather?q=$city&APPID=43ea6baaad7663dc17637e22ee6f78f2");
      if (result.statusCode != 200) throw Exception();

      return parseJson(result.body);
    } catch (e) {
      print("error" + e.toString());
      return null;
    }
  }

  dynamic parseJson(final response) {
    final jsonDecoded = json.decode(response);

    final jsonWeather = jsonDecoded["main"];

    return deserializacionjson(jsonWeather);
  }

  deserializacionjson(Map<String, dynamic> json) {
    weather = Weather(
      temp: json['temp'],
      pressure: json["pressure"],
      humidity: json["humidity"],
      temp_max: json["temp_max"],
      temp_min: json["temp_min"],
    );
    update();

    return weather;
  }
}

class SampleBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WeatherService>(() => WeatherService());
  }
}
// Weather(
//         temp: json['temp'],
//         pressure: json["pressure"],
//         humidity: json["humidity"],
//         temp_max: json["temp_max"],
//         temp_min: json["temp_min"]);
