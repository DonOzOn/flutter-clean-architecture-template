import 'package:intl/intl.dart';

class DateFormatHelper {
  static const String _defaultLocale = 'en-US';
  static const String _weekdayDayMonthYear = 'EEEE, d MMM';
  static const String _hourMinute = 'HH:mm';
  // static const String _fullDay = 'dd MMM, yyyy hh:mm aa';

  /// This method get the end day of a month
  static int getDaysInMonth(DateTime date) {
    return DateTime(date.year, date.month + 1, 0).day;
  }

  static String formatWeekdayDayMonthYear(String? text) {
    return DateFormat(_weekdayDayMonthYear, _defaultLocale)
        .format(DateTime.parse(text ?? '').toLocal())
        .toString();
  }

  static String formatHourMinute(String? text) {
    return DateFormat(_hourMinute, _defaultLocale)
        .format(DateTime.parse(text ?? '').toLocal())
        .toString();
  }

  static final Map<String, Messages> messageMap = {
    'en': EnglishMessages(),
  };

  /// Calculate the duration between a time in the past and show it in english
  static String? timeSince(dynamic value, {String? locale}) {
    late final DateTime dateTime;

    if (value is String) {
      dateTime = DateTime.parse(value);
    } else if (value is DateTime) {
      dateTime = value;
    } else {
      return null;
    }

    final finalLocale = locale ?? _defaultLocale;
    final message = messageMap[finalLocale] ?? EnglishMessages();
    final elapsed =
        DateTime.now().millisecondsSinceEpoch - dateTime.millisecondsSinceEpoch;

    final prefix = message.prefixAgo();
    final suffix = message.suffixAgo();

    ///
    /// Getting [seconds], [minutes], [hours], [days] from provided [dateTime]
    /// by subtracting it from current [DateTime.now()].
    ///
    final num seconds = elapsed / 1000;
    final num minutes = seconds / 60;
    final num hours = minutes / 60;
    final num days = hours / 24;
    final num months = days / 30;
    final num years = months / 12;

    String msg;
    String result;
    if (seconds < 59) {
      msg = message.secsAgo(seconds.round());
      result = [prefix, msg, suffix]
          .where((res) => res.isNotEmpty)
          .join(message.wordSeparator());
    } else if (seconds < 119) {
      msg = message.minAgo(minutes.round());
      result = [prefix, msg, suffix]
          .where((res) => res.isNotEmpty)
          .join(message.wordSeparator());
    } else if (minutes < 59) {
      msg = message.minsAgo(minutes.round());
      result = [prefix, msg, suffix]
          .where((res) => res.isNotEmpty)
          .join(message.wordSeparator());
    } else if (minutes < 119) {
      msg = message.hourAgo(hours.round());
      result = [prefix, msg, suffix]
          .where((res) => res.isNotEmpty)
          .join(message.wordSeparator());
    } else if (hours < 24) {
      msg = message.hoursAgo(hours.round());
      result = [prefix, msg, suffix]
          .where((res) => res.isNotEmpty)
          .join(message.wordSeparator());
    } else if (hours < 48) {
      msg = message.dayAgo(hours.round());
      result = [prefix, msg, suffix]
          .where((res) => res.isNotEmpty)
          .join(message.wordSeparator());
    } else if (days < 31) {
      msg = message.daysAgo(days.round());
      result = [prefix, msg, suffix]
          .where((res) => res.isNotEmpty)
          .join(message.wordSeparator());
    } else if (months < 13) {
      msg = message.monthsAgo(months.round());
      result = [prefix, msg, suffix]
          .where((res) => res.isNotEmpty)
          .join(message.wordSeparator());
    } else {
      msg = message.yearsAgo(years.round());
      result = [prefix, msg, suffix]
          .where((res) => res.isNotEmpty)
          .join(message.wordSeparator());
    }

    return result;
  }

  /// Format date to day, month, year, hour, minute
  /// Example: 01 Jan 2021
  /// [value] can be [String] or [DateTime]
  static String? formatDayMonthYearHour(dynamic value) {
    late final DateTime dateTime;

    if (value is String) {
      dateTime = DateTime.parse(value);
    } else if (value is DateTime) {
      dateTime = value;
    } else {
      return null;
    }

    final formattedDate =
        DateFormat('dd MMM y \'at\' hh:mm a').format(dateTime);
    return formattedDate;
  }

  /// Format date to day, month, year
  /// Example: 01 Jan 2021
  /// [value] can be [String] or [DateTime]
  static String? formatDayMonthYear(dynamic value) {
    late final DateTime dateTime;

    if (value is String) {
      dateTime = DateTime.parse(value);
    } else if (value is DateTime) {
      dateTime = value;
    } else {
      return null;
    }

    final formattedDate = DateFormat('dd MMM y').format(dateTime);
    return formattedDate;
  }
}

abstract class Messages {
  String prefixAgo();

  String prefixFromNow();

  String suffixAgo();

  String suffixFromNow();

  /// When time is less than a minute
  String secsAgo(int seconds);

  /// When time is about a minute
  String minAgo(int minutes);

  /// When time is in minutes
  String minsAgo(int minutes);

  /// When time is about an hour
  String hourAgo(int minutes);

  /// When time is in hours
  String hoursAgo(int hours);

  /// When time is a day
  String dayAgo(int hours);

  /// When time is in days
  String daysAgo(int days);

  String monthsAgo(int months);

  String yearsAgo(int years);

  String wordSeparator() => ' ';
}

class EnglishMessages implements Messages {
  @override
  String prefixAgo() => '';

  @override
  String prefixFromNow() => '';

  @override
  String suffixAgo() => 'ago';

  @override
  String suffixFromNow() => 'from now';

  @override
  String secsAgo(int seconds) => '$seconds seconds';

  @override
  String minAgo(int minutes) => 'a minute';

  @override
  String minsAgo(int minutes) => '$minutes minutes';

  @override
  String hourAgo(int minutes) => 'an hour';

  @override
  String hoursAgo(int hours) => '$hours hours';

  @override
  String dayAgo(int hours) => 'a day';

  @override
  String daysAgo(int days) => '$days days';

  @override
  String monthsAgo(int months) => '$months months';

  @override
  String yearsAgo(int years) => '$years years';

  @override
  String wordSeparator() => ' ';
}

extension DateFormatTryParse on DateFormat {
  DateTime? tryParse(String inputString, [bool utc = false]) {
    try {
      return parse(inputString, utc);
    } on FormatException {
      return null;
    }
  }
}
