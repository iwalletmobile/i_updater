extension RegExpExtension on RegExp {
  String? extractFirstMatch(String body) => firstMatch(body)?.group(1);
}

extension StringExtension on String {
  List<int> get fromStringToIntList => split('.').map((e) => int.tryParse(e) ?? 0).toList();
}
