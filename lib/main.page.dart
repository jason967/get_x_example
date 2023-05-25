import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_x_example/counter/counter.page.dart';
import 'package:get_x_example/home/home.page.dart';
import 'package:get_x_example/main.controller.dart';

import 'wau_reservation/wau_reservation.page.dart';

const iconColor = Color(0xff10cfc9);

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MainController());

    return Obx(
      () => Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: false,
          backgroundColor: Colors.white,
          leadingWidth: 128,
          leading: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Image.asset('assets/icon/logo_wau_horiz.png'),
          ),
        ),
        body: IndexedStack(
          index: controller.currentIdx.value,
          children: const [
            HomePage(),
            Counter(),
            SizedBox.shrink(),
            SizedBox.shrink(),
            SizedBox.shrink(),
            WauReservationPage(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.currentIdx.value,
          type: BottomNavigationBarType.fixed,
          onTap: (index) => controller.indexChange(index),
          backgroundColor: Colors.white,
          unselectedFontSize: 12,
          selectedFontSize: 12,
          selectedItemColor: iconColor,
          items: [
            customItem(
                label: '어디아파', asset: 'assets/svg/ic_tabbar_home_off.svg'),
            customItem(
                label: '진료내역', asset: 'assets/svg/Icon_Document_Off.svg'),
            customItem(
                label: '실손보험', asset: 'assets/svg/Icon_Insurance_Off.svg'),
            customItem(
                label: '스마트문진', asset: 'assets/svg/ic_tabbar_smart_off.svg'),
            customItem(label: '마이페이지', asset: 'assets/svg/Icon_Mypage_Off.svg'),
            customItem(
                label: '예약', asset: 'assets/svg/Icon_Reservation_Off.svg'),
          ],
        ),
      ),
    );
  }
}

BottomNavigationBarItem customItem(
    {required String label, required String asset}) {
  return BottomNavigationBarItem(
    label: label,
    icon: SvgPicture.asset(asset),
    activeIcon: Padding(
      padding: const EdgeInsets.all(4.0),
      child: SvgPicture.asset(asset, color: iconColor),
    ),
  );
}
