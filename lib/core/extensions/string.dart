extension StringExtension on String? {
  bool get isNullOrEmpty => (this == null || (this ?? "").isEmpty);

  String get getFirstOrSingleCharacter {
    if (this != null && this!.isNotEmpty) {
      return this!.substring(0, 1);
    } else {
      return "";
    }
  }

  String get capitalize {
    if (isNullOrEmpty) {
      return "";
    } else {
      return "${this![0].toUpperCase()}${this!.substring(1).toLowerCase()}";
    }
  }
}