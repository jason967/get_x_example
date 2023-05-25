part of 'calendar_x.controller.dart';

List<CalendarData> _genCalendar(int year, int month) {
  final List<CalendarData> calendar = [];

  /// 현재 선택된 달의 마지막 날
  final lastDay = DateTime(year, month + 1, 0).day;

  /// 현재 선택된 달의 첫번째 날의 요일
  final firstWeekday = DateTime(year, month, 1).weekday;
  final prevMonth = (month - 1 == 0) ? 12 : month - 1;
  final nextMonth = (month + 1 == 13) ? 1 : month + 1;

  final prevLastDay = DateTime(year, month, 0).day;

  var calendarCount = _cal(lastDay, firstWeekday);

  if (firstWeekday != 7) {
    for (int i = firstWeekday - 1; i >= 0; i--) {
      final calendarData =
          CalendarData(year, prevMonth, prevLastDay - i, disabled: true);
      calendar.add(calendarData);
    }
  }

  for (int day = 1; day <= lastDay; day++) {
    final calendarData = CalendarData(year, month, day);
    calendar.add(calendarData);
  }
  final restDay = calendarCount - calendar.length;
  for (int day = 1; day <= restDay; day++) {
    final calendarData = CalendarData(year, nextMonth, day, disabled: true);
    calendar.add(calendarData);
  }

  return calendar;
}

int _cal(int dayCount, int weekday) {
  if (weekday == 5) {
    return (dayCount > 30) ? 42 : 35;
  } else if (weekday == 6) {
    return (dayCount >= 30) ? 42 : 35;
  }
  return 35;
}

enum ResState { none, holiday, am, pm, completed }

class CalendarData {
  int year;
  int month;
  int day;
  ResState resState;
  bool disabled;

  CalendarData(
    this.year,
    this.month,
    this.day, {
    this.resState = ResState.none,
    this.disabled = false,
  });

  @override
  String toString() {
    return 'Calender($year,$month,$day)';
  }
}
