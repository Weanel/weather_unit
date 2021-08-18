import '../unit_standard.dart';

/// [Humidity] is the water vapour in the air
///
/// This unit is can not be comparable
class Humidity extends WeatherUnit {
  /// Assign [Humidity]'s percentage as [value]
  ///
  /// Throws [ArgumentError] if [value] is lower than 0 or higher than 100
  Humidity(num value) : super(value) {
    if (value > 100 || value < 0) {
      throw new ArgumentError.value(
          value, "value", "Humid should between 0 - 100%");
    }
  }

  @override
  String toString() => value.toString() + symbol;

  @override
  String get symbol => "%";
}
