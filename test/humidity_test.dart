import "package:test/test.dart";

import "package:weather_unit/src/humidity/humidity.dart";

void main() {
  group("Humidity test", () {
    test("No out of range humidity", () {
      expect(() => Humidity(109), throwsA(isArgumentError));
    });
  });
}
