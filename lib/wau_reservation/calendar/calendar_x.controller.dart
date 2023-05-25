import 'package:get/get.dart';

part 'calendar_x_utils.dart';

class CalendarController extends GetxController {
  static DateTime today = DateTime.now();

  RxInt year = today.year.obs;
  RxInt month = today.month.obs;
  RxList days = [].obs;

  @override
  void onInit() {
    calendarInit(year.value, month.value);
    super.onInit();
  }

  calendarInit(int curYear, int curMonth) {
    year.value = curYear;
    month.value = curMonth;
    setDays(curYear, curMonth);
  }

  setDays(int curYear, int curMonth) {
    days.clear();
    days.value = _genCalendar(curYear, curMonth);
  }

  void thisMonth() {
    year.value = today.year;
    month.value = today.month;
    setDays(year.value, month.value);
  }

  void prevMonth() {
    month.value--;
    if (month.value == 0) {
      month.value = 12;
      year.value--;
    }
    setDays(year.value, month.value);
  }

  void nextMonth() {
    month.value++;
    if (month.value == 13) {
      month.value = 1;
      year.value++;
    }
    setDays(year.value, month.value);
  }
}
