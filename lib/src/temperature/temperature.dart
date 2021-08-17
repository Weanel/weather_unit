import '../unit_standard.dart';

part './celsius.dart';
part './fahrenheit.dart';

/// A [Celsius]'s value of absolute zero which can not be lower
final double absoluteZeroC = -273.15;

/// [Temperature] is a unit for expressiong hot and cold
abstract class Temperature extends WeatherUnit implements UnitComparable {
  /// Assign [Tempurture] [value]
  ///
  /// Throws [ArgumentError] if [value] lower than [absoluteZeroC] in [Celsius]
  Temperature(double value) : super(value) {
    double valInC = this.value;
    if (this is Fahrenheit) {
      valInC = (this as Fahrenheit).toCelsius.value;
    }
    if (valInC < absoluteZeroC) {
      throw new ArgumentError.value(this.value, "value",
          "The tempurture should not lower than absolute zero (-273.15°C)");
    }
  }

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
      value.toStringAsFixed(fractionDigits);

  /// Export from [toFixedString] then invoke [double.parse].
  /// Therefore, it is impossible to invoke [FormatException]
  double toFixed(int fractionDigits) =>
      double.parse(toFixedDoubleStringValue(fractionDigits));

  /// Convert to [String] for displaying [Tempurture] data
  @override
  String toString() => toFixedDoubleStringValue(1) + (this.symbol ?? "°");

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
