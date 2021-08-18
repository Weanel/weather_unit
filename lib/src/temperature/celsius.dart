part of 'temperature.dart';

/// [Celsius] is a unit of [Tempurture] which used by majority countries
///
/// Here is the concept of [Celsius]
/// * Water bwoling and melting
///   * Melting point: ~ 0°C
///   * Bowling point: ~ 100°C
/// * Human normal temperature: 37.5°C
class Celsius extends Temperature {
  /// Assign [Celsius] [value]
  Celsius(num value) : super(value);

  @override
  String get symbol => "°C";

  /// Convert to [Fahrenheit]
  Fahrenheit get toFahrenheit => Fahrenheit((this.value * (9 / 5) + 32));

  double _valueFromFahrenheit(Fahrenheit fahrenheit) =>
      fahrenheit.toCelsius.value;

  @override
  // ignore: hash_and_equals
  bool operator ==(Object compare) => _comparsion(
      compare,
      (compareTemp) =>
          value ==
          ((compareTemp is Fahrenheit)
              ? _valueFromFahrenheit(compareTemp)
              : compareTemp.value));

  @override
  bool operator >(Object compare) => _comparsion(
      compare,
      (compareTemp) =>
          value >
          ((compareTemp is Fahrenheit)
              ? _valueFromFahrenheit(compareTemp)
              : compareTemp.value));

  @override
  bool operator <(Object compare) => _comparsion(
      compare,
      (compareTemp) =>
          value <
          ((compareTemp is Fahrenheit)
              ? _valueFromFahrenheit(compareTemp)
              : compareTemp.value));

  @override
  bool operator >=(Object compare) => _comparsion(
      compare,
      (compareTemp) =>
          value >=
          ((compareTemp is Fahrenheit)
              ? _valueFromFahrenheit(compareTemp)
              : compareTemp.value));

  @override
  bool operator <=(Object compare) => _comparsion(
      compare,
      (compareTemp) =>
          value <=
          ((compareTemp is Fahrenheit)
              ? _valueFromFahrenheit(compareTemp)
              : compareTemp.value));
}
