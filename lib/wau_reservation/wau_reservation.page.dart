import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import 'calender/utils.dart';

class WauReservationPage extends StatelessWidget {
  const WauReservationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const ReservationCalender(),
        ],
      ),
    );
  }
}

class ReservationCalender extends StatelessWidget {
  const ReservationCalender({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      onDaySelected: (selc, focus) {
        print('[test] $kFirstDay , $kLastDay ');
        return;
      },
      headerStyle: HeaderStyle(
        titleCentered: false,
      ),
      locale: 'ko-KR',
      focusedDay: DateTime.now(),
      firstDay: kFirstDay,
      lastDay: kLastDay,
    );
  }
}
