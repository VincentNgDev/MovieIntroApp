import 'package:intl/intl.dart';

class DateTimeHelper {
  static String dateTimeToStr({
    required DateTime dateTime,
    required DateTimeType dateTimeType,
    String? spacingPattern,
    MonthMode monthMode = MonthMode.num,
  }) {
    /// Spacing Pattern
    String spacing = spacingPattern ?? '/';

    /// Month Mode
    String monthModeInString = 'MM';
    switch (monthMode) {
      case MonthMode.num:
        monthModeInString = 'MM';
        break;
      case MonthMode.abbreviation:
        monthModeInString = 'MMM';
        break;
      case MonthMode.full:
        monthModeInString = 'MMMM';
        break;
      default:
        monthModeInString = 'MM';
    }

    /// Date Time Type
    switch (dateTimeType) {
      case DateTimeType.dMy:
        String date = '';
        date = DateFormat('dd$spacing$monthModeInString${spacing}yyyy')
            .format(dateTime);
        return date;
      case DateTimeType.yMd:
        String date = '';
        date = DateFormat('yyyy$spacing$monthModeInString${spacing}dd')
            .format(dateTime);
        return date;
      case DateTimeType.dM:
        String date = '';
        date = DateFormat('dd$spacing$monthModeInString').format(dateTime);
        return date;
      case DateTimeType.Md:
        String date = '';
        date = DateFormat('$monthModeInString${spacing}dd').format(dateTime);
        return date;
      default:
        return dateTime.toString();
    }
  }

  static DateTime? strToDateTime({
    required String dateTime,
    required DateTimeType dateTimeType,
    required String spacingPattern,
    MonthMode monthMode = MonthMode.num,
  }) {
    DateTime? returnDateTime;

    /// Month Mode
    String monthModeInString = 'MM';
    switch (monthMode) {
      case MonthMode.num:
        monthModeInString = 'MM';
        break;
      case MonthMode.abbreviation:
        monthModeInString = 'MMM';
        break;
      case MonthMode.full:
        monthModeInString = 'MMMM';
        break;
      default:
        monthModeInString = 'MM';
    }

    /// Date Time Type
    switch (dateTimeType) {
      case DateTimeType.dMy:
        returnDateTime = DateFormat(
          'dd$spacingPattern$monthModeInString${spacingPattern}yyyy',
        ).parse(dateTime);
        break;
      case DateTimeType.yMd:
        returnDateTime = DateFormat(
          'yyyy$spacingPattern$monthModeInString${spacingPattern}dd',
        ).parse(dateTime);
        break;
      case DateTimeType.dM:
        returnDateTime = DateFormat(
          'dd$spacingPattern$monthModeInString',
        ).parse(dateTime);
        break;
      case DateTimeType.Md:
        returnDateTime = DateFormat(
          '$monthModeInString${spacingPattern}dd',
        ).parse(dateTime);
        break;
      default:
    }

    return returnDateTime;
  }

  static String convertDate({
    required String dateTime,
    required DateTimeType dateTimeType,
    required String spacingPattern,
    String? resultSpacingPattern,
    MonthMode monthMode = MonthMode.num,
  }) {
    DateTime? returnDT = strToDateTime(
      dateTime: dateTime,
      dateTimeType: dateTimeType,
      spacingPattern: spacingPattern,
      monthMode: monthMode,
    );

    if (returnDT != null) {
      return dateTimeToStr(
        dateTime: returnDT,
        dateTimeType: dateTimeType,
        monthMode: monthMode,
        spacingPattern: resultSpacingPattern,
      );
    }
    return dateTime;
  }

  /// Return True if is leapYear
  static bool isLeapYear({required int year}) {
    return (year % 4 == 0) && ((year % 100 != 0) || (year % 400 == 0));
  }

  /// The number of leap year
  static int numberOfLeapYear({required DateTime min, required DateTime max}) {
    int numberOfLeap = 0;
    // print('numberOfLeapYear Min: $min -  Max: $max');
    for (var year = min.year; year <= max.year; year++) {
      if ((year % 4 == 0) && ((year % 100 != 0) || (year % 400 == 0))) {
        numberOfLeap = numberOfLeap + 1;
      }
      // debugPrint(
      //   '$year: ${(year % 4 == 0) && ((year % 100 != 0) || (year % 400 == 0))}',
      // );
    }
    return numberOfLeap;
  }
}

enum DateTimeType {
  dM,
  Md,
  yMd,
  dMy,
  Hm,
  hm,
  hma,
}

enum TimeMode {
  hr24,
  hr12,
}

enum MonthMode {
  num,
  abbreviation,
  full,
}
