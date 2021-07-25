import 'package:weather_unit/weather_unit.dart';

void main() {
  // Sample temperature is 25.5°C
  final Celsius demoTemp = Celsius(25.5);

  // Sample humidity is 75%
  final Humidity demoHumid = Humidity(75);

  // Print result: {temperature: 25.5°C, humidity: 75%}
  print({"temperature", demoTemp.toString(), "humidity", demoHumid.toString()});

  // Convert to Fahrenheit
  print(demoTemp.toString() +
      " in Fahrenheit is " +
      demoTemp.toFahrenheit.toString());
}
