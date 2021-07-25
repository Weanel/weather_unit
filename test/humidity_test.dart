import "package:test/test.dart";

import "package:weather_unit/src/humidity/humidity.dart";

void main() {
  group("Humidity test", () {
    test("Disallow foregin humidity comparsion", () {
      expect(() => Humidity(80) >= Humidity(79, foregin: true),
          throwsA(isA<ForeginHumidComparsionException>()));
    });
    test("No out of range humidity", () {
      expect(() => Humidity(109), throwsA(isArgumentError));
    });
  });
}
