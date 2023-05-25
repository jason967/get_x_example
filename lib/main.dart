import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'main.page.dart';

void main() {
  initializeDateFormatting()
      .then((_) => runApp(const GetMaterialApp(home: MainPage())));
}

final List<String> days = ['일', '월', '화', '수', '목', '금', '토'];

// void main() {
//   final List<CalendarData> calendar = [];
//
//   const year = 2023;
//   const curMonth = 5;
//   final curDays = DateTime(year, curMonth, 0).day;
//   final curFirstWeekday = DateTime(year, curMonth, 1).weekday;
//   const prevMonth = curMonth - 1 == 0 ? 12 : curMonth - 1;
//   const nextMonth = curMonth + 1 == 13 ? 1 : curMonth + 1;
//
//   final prevLastDay = DateTime(year, prevMonth, 0).day;
//
//   if (curFirstWeekday != 7) {
//     for (int i = curFirstWeekday; i > 0; i--) {
//       final calendarData = CalendarData(year, prevMonth, prevLastDay - i);
//       calendar.add(calendarData);
//     }
//   }
//   // 이번달 날 리스트에 넣음
//   for (int day = 1; day <= curDays; day++) {
//     final calendarData = CalendarData(year, curMonth, day);
//     calendar.add(calendarData);
//   }
//
//   for (int day = 1; day <= 35 - calendar.length; day++) {
//     final calendarData = CalendarData(year, curMonth, day);
//     calendar.add(calendarData);
//   }
//
//   print('$curFirstWeekday');
//   print(calendar);
//   // final test = today
//   // final weekDay = today.weekday;
//   // print('${days[weekDay]}');
// }

enum ResState { none, am, pm, completed }

class CalendarData {
  int year;
  int month;
  int day;
  ResState resState;
  bool checked;

  CalendarData(
    this.year,
    this.month,
    this.day, {
    this.resState = ResState.none,
    this.checked = false,
  });

  @override
  String toString() {
    return 'Calender($year,$month,$day,$resState,$checked)';
  }
}
