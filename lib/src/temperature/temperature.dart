import '../unit_standard.dart';

part './celsius.dart';
part './fahrenheit.dart';

/// A [Celsius]'s value of absolute zero which can not be lower
final double absoluteZeroC = -273.15;

/// [Temperature] is a unit for expressiong hot and cold
abstract class Temperature with UnitComparable, UnitSymbol {
  /// [Tempurture]'s value with declared unit
  double _value;

  /// Tempurture's [symbol] which used for display
  String get symbol;

  /// Assign [Tempurture] [value]
  ///
  /// Throws [ArgumentError] if [value] lower than [absoluteZeroC] in [Celsius]
  Temperature(double value) : _value = value {
    double valInC = _value;
    if (this is Fahrenheit) {
      valInC = (this as Fahrenheit).toCelsius.value;
    }
    if (valInC < absoluteZeroC) {
      throw new ArgumentError.value(_value, "value",
          "The tempurture should not lower than absolute zero (-273.15°C)");
    }
  }

  /// Get completed [value] of [Temperature]
  double get value => _value;

  bool _comparsion(
      Object compare, bool Function(Temperature compareTemp) compareMethod) {
    if (!(compare is Temperature)) {
      // Disallow using non-Temperature to compare
      throw new TypeError();
    }
    return compareMethod(compare);
  }

  /// Export fixed [double] [String] with [fractionDigits]
  String toFixedDoubleStringValue(int fractionDigits) =>
      _value.toStringAsFixed(fractionDigits);

  /// Export from [toFixedString] then invoke [double.parse].
  /// Therefore, it is impossible to invoke [FormatException]
  double toFixed(int fractionDigits) =>
      double.parse(toFixedDoubleStringValue(fractionDigits));

  /// Convert to [String] for displaying [Tempurture] data
  @override
  String toString() => toFixedDoubleStringValue(1) + symbol;

  /// Compare this tempurture is the same with [compare]
  ///
  /// Throws [TypeError] if [compare] is not [Temperature]
  // ignore: hash_and_equals
  bool operator ==(Object compare);

  /// Compare this tempurture is warmer than [compare]
  ///
  /// Throws [TypeError] if [compare] is not [Temperature]
  bool operator >(Object compare);

  /// Compare this tempurture is cooler than [compare]
  ///
  /// Throws [TypeError] if [compare] is not [Temperature]
  bool operator <(Object compare);

  /// Compare this tempurture is warmer or equal [compare]
  ///
  /// Throws [TypeError] if [compare] is not [Temperature]
  bool operator >=(Object compare);

  /// Compare this tempurture is cooler or equal [compare]
  ///
  /// Throws [TypeError] if [compare] is not [Temperature]
  bool operator <=(Object compare);
}
