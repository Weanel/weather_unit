/// Mark [UnitComparable] allowing the unit uses operator with same sub-class
///
/// P.S. [==] is inherited from [Object]
mixin UnitComparable {
  /// When [this] object's value is laarger of [compare]
  bool operator >(Object compare);

  /// When [this] object's value is smaller of [compare]
  bool operator <(Object compare);

  /// When [this] object's value is larger or equal than [compare]
  bool operator >=(Object compare);

  /// When [this] object's value is smaller or equal than [compare]
  bool operator <=(Object compare);
}

/// Mark [UnitSymbol] to define this unit has symbol or unit for display
mixin UnitSymbol {
  /// [symbol] in string
  String get symbol;
}
