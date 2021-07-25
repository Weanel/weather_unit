import '../unit_standard.dart';

/// Throws [this] exception when trying to compare [Humidity] with
/// [Humidity.foregin] as `true`
class ForeginHumidComparsionException implements Exception {
  /// Message of [this] exception
  final String message;

  /// Create [this] exception with custom [message]
  ForeginHumidComparsionException.message(this.message);

  /// Create [this] exception with default [message]
  factory ForeginHumidComparsionException() =>
      ForeginHumidComparsionException.message(
          "Using foregin humidity data to compare is disallowed");
}

class Humidity with UnitComparable {
  /// Percentage of humidity
  int _value;

  /// Mark [foregin] as true means this [Humidity]'s data source is
  /// from different location which disallow doing comparsion when set `true`
  final bool foregin;

  /// Assign [Humidity]'s percentage as [value]
  ///
  /// Throws [ArgumentError] if [value] is lower than 0 or higher than 100
  Humidity(int value, {this.foregin = false}) : _value = value {
    if (_value > 100 || _value < 0) {
      throw new ArgumentError.value(
          _value, "value", "Humid should between 0 - 100%");
    }
  }

  bool _comparsion(
      Object compare, bool Function(Humidity compareHumid) compareMethod) {
    if (!(compare is Humidity)) {
      throw new TypeError();
    } else if ((compare as Humidity).foregin || this.foregin) {
      throw new ForeginHumidComparsionException();
    }
    return compareMethod(compare);
  }

  /// Compare [this] value is the same of [compare]
  ///
  /// Throws [TypeError] if [compare] is not [Humidity].
  /// Throws [ForeginHumidComparsionException] if either [this] or [compare]
  /// set [foregin] as true
  @override
  bool operator ==(Object compare) =>
      _comparsion(compare, (compareHumid) => _value == compareHumid._value);

  /// Compare [this] value is less than [compare]
  ///
  /// Throws [TypeError] if [compare] is not [Humidity].
  /// Throws [ForeginHumidComparsionException] if either [this] or [compare]
  /// set [foregin] as true
  @override
  bool operator <(Object compare) =>
      _comparsion(compare, (compareHumid) => _value < compareHumid._value);

  /// Compare [this] value is less or equal [compare]
  ///
  /// Throws [TypeError] if [compare] is not [Humidity].
  /// Throws [ForeginHumidComparsionException] if either [this] or [compare]
  /// set [foregin] as true
  @override
  bool operator <=(Object compare) =>
      _comparsion(compare, (compareHumid) => _value <= compareHumid._value);

  /// Compare [this] value is larger than [compare]
  ///
  /// Throws [TypeError] if [compare] is not [Humidity].
  /// Throws [ForeginHumidComparsionException] if either [this] or [compare]
  /// set [foregin] as true
  @override
  bool operator >(Object compare) =>
      _comparsion(compare, (compareHumid) => _value > compareHumid._value);

  /// Compare [this] value is larger of equal [compare]
  ///
  /// Throws [TypeError] if [compare] is not [Humidity].
  /// Throws [ForeginHumidComparsionException] if either [this] or [compare]
  /// set [foregin] as true
  @override
  bool operator >=(Object compare) =>
      _comparsion(compare, (compareHumid) => _value >= compareHumid._value);

  @override
  String toString() => _value.toString() + "%";
}
