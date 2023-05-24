import 'package:intl/intl.dart';


String banklyDateTimeFormat(String date) {
  return DateFormat("dd, MMM yyyy, h:mm:ss a")
      .format(DateTime.tryParse(date) ?? DateTime.now());
}
String banklyDateTimeFormat2(String date) {
  return DateFormat("dd/MM/yyyy h:mm:ss a")
      .format(DateTime.tryParse(date) ?? DateTime.now());
}

