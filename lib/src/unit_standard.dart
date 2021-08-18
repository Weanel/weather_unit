/// Standard interface of [WeatherUnit]
abstract class WeatherUnit {
  double _value;

  /// Create new data of [WeatherUnit]
  WeatherUnit(num value) : _value = value.toDouble();

  /// Actual value of this [WeatherUnit]
  double get value => _value;

  /// Symbol of [WeatherUnit]
  String? get symbol;
}

/// Mark [UnitComparable] allowing the unit uses operator with same sub-class
///
/// P.S. [==] is inherited from [Object]
abstract class UnitComparable {
  /// When [this] object's value is larger of [compare]
  bool operator >(Object compare);

  /// When [this] object's value is smaller of [compare]
  bool operator <(Object compare);

  /// When [this] object's value is larger or equal than [compare]
  bool operator >=(Object compare);

  /// When [this] object's value is smaller or equal than [compare]
  bool operator <=(Object compare);
}
