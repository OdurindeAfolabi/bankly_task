
extension StringExtension on String {
  String get addOverFlow {
    if (length < 20) {
      return this;
    } else {
      return "${substring(0, 20)}...";
    }
  }
}
