extension ListMapExtension on List<Map<dynamic, dynamic>> {
  List<Map<String, dynamic>> toMapString() => map(
      (Map<dynamic, dynamic> json) => json.map((dynamic key, dynamic value) =>
          MapEntry<String, dynamic>(key.toString(), value))).toList();
}

extension ListExtension<T> on List<T> {
  List<T> updateWhere(
          {required bool Function(T item) test, required T updateTo}) =>
      map((T element) => test(element) ? updateTo : element).toList();
}
