extension StringExtension on String {
  String showFirstLetter() => isNotEmpty ? substring(0, 1).toUpperCase() : '';
}
