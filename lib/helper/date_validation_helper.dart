import 'package:intl/intl.dart';

class DateValidationHelper {
  // final String defaultLocale = Platform.localeName; // Returns locale string in the form 'en_US'
  static DateFormat get defaultFormat => DateFormat('dd/MM/yyyy');

  static bool isValidBeforeCurrentDate(DateTime date) {
    return DateTime.now().isBefore(date);
  }

  static bool isValidBefore(DateTime date, DateTime dateCompare) {
    return date.isBefore(dateCompare);
  }

  static bool isValidAfter(DateTime date, DateTime dateCompare) {
    return date.isAfter(dateCompare);
  }

  static bool isValidDateValue(String val) {
    try {
      defaultFormat.parseStrict(val);
      return true;
    } catch (e) {
      return false;
    }
  }

  static bool isValidDateRange(
      DateTime fromDate, DateTime toDate, int limitDate) {
    final differ = toDate.difference(fromDate).inDays;
    return limitDate >= differ;
  }

  static bool isSameWithCurrentDate(DateTime other) {
    final now = DateTime.now();
    return other.year == now.year &&
        other.month == now.month &&
        other.day == now.day;
  }

  // static DateTime stringToDate(String inputDate) {
  //   return defaultFormat.parse(inputDate);
  // }
}
