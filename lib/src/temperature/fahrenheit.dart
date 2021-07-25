part of 'temperature.dart';

/// [Fahrenheit] is a unit of [Tempurture] which used by majority countries
///
/// Here is the concept of [Fahrenheit]
/// * Water bwoling and melting
///   * Melting point: ~ 32°F
///   * Bowling point: ~ 212°F
/// * Human normal temperature: 99.5°F
class Fahrenheit extends Temperature {
  /// Assign [Fahrenheit] [value]
  Fahrenheit(double value) : super(value);

  @override
  String get symbol => "°F";

  /// Convert to [Celsius]
  Celsius get toCelsius => Celsius((_value - 32) * (5 / 9));

  double _valueFromCelsius(Celsius celsius) => celsius.toFahrenheit._value;

  @override
  // ignore: hash_and_equals
  bool operator ==(Object compare) => _comparsion(
      compare,
      (compareTemp) =>
          value ==
          ((compareTemp is Celsius)
              ? _valueFromCelsius(compareTemp)
              : compareTemp.value));

  @override
  bool operator >(Object compare) => _comparsion(
      compare,
      (compareTemp) =>
          value >
          ((compareTemp is Celsius)
              ? _valueFromCelsius(compareTemp)
              : compareTemp.value));

  @override
  bool operator <(Object compare) => _comparsion(
      compare,
      (compareTemp) =>
          value <
          ((compareTemp is Celsius)
              ? _valueFromCelsius(compareTemp)
              : compareTemp.value));

  @override
  bool operator >=(Object compare) => _comparsion(
      compare,
      (compareTemp) =>
          value >=
          ((compareTemp is Celsius)
              ? _valueFromCelsius(compareTemp)
              : compareTemp.value));

  @override
  bool operator <=(Object compare) => _comparsion(
      compare,
      (compareTemp) =>
          value <=
          ((compareTemp is Celsius)
              ? _valueFromCelsius(compareTemp)
              : compareTemp.value));
}
