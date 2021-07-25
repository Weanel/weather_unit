import "package:test/test.dart";

import 'package:weather_unit/weather_unit.dart';

void main() {
  test("Throw TypeError if compare with different types", () {
    expect(() => Humidity(99) == Celsius(25), throwsA(isA<TypeError>()));
  });
}
