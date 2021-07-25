import "package:test/test.dart";

import "package:weather_unit/src/temperature/temperature.dart";

final Celsius testC = Celsius(0);
final Fahrenheit testF = Fahrenheit(32);

void main() {
  group("Temperature", () {
    group("Disallow lower than absolute zero in", () {
      test("Celsius", () {
        expect(() => Celsius(-300), throwsA(isArgumentError));
      });
      test("Fahrenheit", () {
        expect(() => Fahrenheit(-600), throwsA(isArgumentError));
      });
    });
    group("Unit conversion", () {
      test("C to F", () {
        expect(testC.toFahrenheit.value, testF.value);
      });
      test("F to C", () {
        expect(testF.toCelsius.value, testC.value);
      });
    });
    group("Operator", () {
      test("equal test", () {
        expect(testC == testF, true);
      });
      test("larger test", () {
        expect(Celsius(30) > Fahrenheit(100), false);
      });
      test("smaller test", () {
        expect(Celsius(30) < Fahrenheit(100), true);
      });
      test("non-equal test", () {
        expect(Celsius(25) != Fahrenheit(80), true);
      });
    });
  });
}
