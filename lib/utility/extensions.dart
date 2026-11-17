extension StringToInt on String {
  /// "1,496" "¥1,496" "1496円" "537.0" などを int にする。変換できなければ null
  int? toIntOrNull() {
    final String s = replaceAll(',', '').replaceAll('¥', '').replaceAll('￥', '').replaceAll('円', '').trim();
    return int.tryParse(s) ?? double.tryParse(s)?.toInt();
  }

  /// 変換できなければ 0
  int toInt() => toIntOrNull() ?? 0;
}

extension IntToYen on int {
  /// 1496 → ¥1,496
  String toYen() {
    final String s = toString().replaceAllMapped(RegExp(r'(\d)(?=(\d{3})+$)'), (Match m) => '${m[1]},');
    return '¥$s';
  }
}
