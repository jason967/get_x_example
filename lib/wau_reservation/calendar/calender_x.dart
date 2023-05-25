import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'calendar_x.controller.dart';

const black = Color.fromRGBO(60, 61, 71, 1);
const grey = Color.fromRGBO(106, 106, 106, 1);
const bgGrey = Color.fromRGBO(245, 245, 245, 1);
const warmGrey = Color.fromRGBO(142, 149, 155, 1);

final List<String> weekdays = ['일', '월', '화', '수', '목', '금', '토'];

class CalenderX extends StatelessWidget {
  const CalenderX({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CalendarController());

    return Column(
      children: [
        const SizedBox(height: 16),
        SizedBox(
          height: 28,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '예약 일시 선택',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: black,
                  ),
                ),
                GestureDetector(
                  onTap: controller.thisMonth,
                  child: Container(
                    height: 28,
                    width: 62,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      border: Border.all(color: grey),
                      color: bgGrey,
                    ),
                    child: const Text(
                      '이번달',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        color: grey,
                      ),
                    ),
                  ),
                ),
                const _Month(),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        const _Calendar(),
      ],
    );
  }
}

class _Calendar extends StatelessWidget {
  const _Calendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CalendarController());

    return Obx(() => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            border: Border.all(color: warmGrey),
          ),
          child: Column(
            children: [
              const _Weekdays(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: controller.days
                          .sublist(0, 7)
                          .map((e) => _DayCell(e))
                          .toList(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: controller.days
                          .sublist(7, 14)
                          .map((e) => _DayCell(e))
                          .toList(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: controller.days
                          .sublist(14, 21)
                          .map((e) => _DayCell(e))
                          .toList(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: controller.days
                          .sublist(21, 28)
                          .map((e) => _DayCell(e))
                          .toList(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: controller.days
                          .sublist(
                              28,
                              controller.days.length > 35
                                  ? 35
                                  : controller.days.length)
                          .map((e) => _DayCell(e))
                          .toList(),
                    ),
                    if (controller.days.length > 35)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: controller.days
                            .sublist(35, controller.days.length)
                            .map((e) => _DayCell(e))
                            .toList(),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

// class _Board extends StatelessWidget {
//   const _Board({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     // final controller = Get.put(CalendarController());
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children:
//             controller.days.sublist(0, 7).map((e) => _DayCell(e)).toList(),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children:
//             controller.days.sublist(7, 7).map((e) => _DayCell(e)).toList(),
//           ),
//         ],
//       ),
//     );
//   }
// }

class _DayCell extends StatelessWidget {
  const _DayCell(this.dayInfo, {Key? key}) : super(key: key);
  final CalendarData dayInfo;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      width: 44,
      child: Center(
        child: Text(
          '${dayInfo.day}',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: dayInfo.disabled ? grey : black,
          ),
        ),
      ),
    );
  }
}

class _Month extends StatelessWidget {
  const _Month({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CalendarController());

    return GestureDetector(
      child: SizedBox(
        height: 28,
        child: Row(
          children: [
            _MonthChangeBtn(
              icon: Icons.chevron_left,
              onPress: controller.prevMonth,
            ),
            const SizedBox(width: 8),
            Obx(() => Text(
                  '${controller.month}월',
                  style: const TextStyle(
                    color: black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                )),
            const SizedBox(width: 8),
            _MonthChangeBtn(
              icon: Icons.chevron_right,
              onPress: controller.nextMonth,
            ),
          ],
        ),
      ),
    );
  }
}

class _Weekdays extends StatelessWidget {
  const _Weekdays({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: weekdays
            .map(
              (e) => SizedBox(
                height: 44,
                width: 44,
                child: Center(
                  child: Text(
                    e,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class _MonthChangeBtn extends StatelessWidget {
  const _MonthChangeBtn({required this.icon, required this.onPress, Key? key})
      : super(key: key);
  final IconData icon;
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: SizedBox(
        height: 28,
        width: 28,
        child: Icon(icon, color: warmGrey),
      ),
    );
  }
}
