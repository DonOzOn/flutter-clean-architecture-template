import 'package:collection/collection.dart';

class StringHelper {
  StringHelper._();

  static bool isNullOrEmpty(String? value) => value == null || value.isEmpty;

  static bool isNotNullOrEmpty(String? value) => !isNullOrEmpty(value);

  static int? extractNumber(String value) {
    return int.tryParse(value.replaceAll(RegExp(r'[^0-9]'), ''));
  }

  static bool? isNumeric(String s) {
    final numeric = s.replaceAll(RegExp(r'[^0-9]'), '');
    return num.tryParse(numeric) != null;
  }

  static bool isEmail(String value) {
    if (isNullOrEmpty(value)) {
      return false;
    }

    const Pattern emailRegex =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    return RegExp(emailRegex as String).hasMatch(value);
  }

  static bool isPhoneNumber(String value) {
    const Pattern phoneRegex = r'^(?:[+0]9)?[0-9]{10}$';
    if (isNotNullOrEmpty(value)) {
      return RegExp(phoneRegex as String).hasMatch(value);
    }
    return false;
  }

  static String collapseText(String text, {int maxLength = 100}) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return '${text.substring(0, maxLength)}...';
    }
  }

  static String? formatDoubleValue(
    dynamic value, {
    int? decimalPoint,
    bool hasSign = false,
  }) {
    double? numValue;
    if (value == null) {
      return null;
    } else if (value is String) {
      // Remove ',' from value
      final validValueFormat = value.replaceAll(',', '');
      numValue = double.tryParse(validValueFormat);

      if (numValue == null) {
        return value;
      }
    } else if (value == num) {
      numValue = value;
    } else {
      // Not supported
      return null;
    }

    final formattedValue = numValue?.toStringAsFixed(decimalPoint ?? 2);
    return (hasSign && numValue != null && numValue > 0)
        ? '+$formattedValue'
        : formattedValue;
  }
  /// Convert html to string
  /// [html] is html string
  /// Return string
  /// Example:
  /// html = '<p>abc</p><p>def</p><p>ghi</p>'  => 'abc def ghi'

  static String htmlToString(String html) {
    final exp = RegExp(r'<[^>]*>', multiLine: true, caseSensitive: true);

    return html.replaceAll(exp, ' ').trim();
  }

  /// Join text array to string
  /// [texts] is list of text
  /// [separator] is separator between text in array (default is '') (optional)
  /// Return string
  /// texts = ['a', 'b', 'c']  => 'abc' (separator = '') or 'a,b,c' (separator = ',')
  /// texts = ['a', null, 'c']  => 'ac' (separator = '') or 'a,c' (separator = ',')
  /// texts = [null, null, null]  => '' (separator = '') or '' (separator = ',')
  /// texts = null  => '' (separator = '') or '' (separator = ',')
  /// texts = []  => '' (separator = '') or '' (separator = ',')
  static String joinTextArray(List<String?>? texts,
      [String separator = '']) {
    final contributorFilter = texts?.whereNotNull();
    final textContributor = contributorFilter?.join(separator) ?? '';
    return textContributor;
  }
}
