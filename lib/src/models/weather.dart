class Weather {
  double temp;
  int pressure;
  int humidity;
  double temp_max;
  double temp_min;

  double get getTemp => temp - 272.5;
  double get getMaxTemp => temp_max - 272.5;
  double get getMinTem => temp_min - 272.5;

  Weather(
      {this.temp, this.pressure, this.humidity, this.temp_max, this.temp_min});
}
