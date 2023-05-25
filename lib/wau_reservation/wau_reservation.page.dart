import 'package:flutter/material.dart';

import 'calendar/calender_x.dart';

class WauReservationPage extends StatelessWidget {
  const WauReservationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const CalenderX(),
        ],
      ),
    );
  }
}

// class ReservationCalender extends StatelessWidget {
//   const ReservationCalender({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return TableCalendar(
//       onDaySelected: (selc, focus) {
//         print('[test] $kFirstDay , $kLastDay ');
//         return;
//       },
//       headerStyle: HeaderStyle(
//         titleCentered: false,
//       ),
//       locale: 'ko-KR',
//       focusedDay: DateTime.now(),
//       firstDay: kFirstDay,
//       lastDay: kLastDay,
//     );
//   }
// }
