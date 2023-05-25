import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'main.page.dart';

void main() {
  initializeDateFormatting()
      .then((_) => runApp(const GetMaterialApp(home: MainPage())));
}
