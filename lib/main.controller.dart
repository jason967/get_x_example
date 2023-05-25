import 'package:get/get.dart';

class MainController extends GetxController {
  var currentIdx = 0.obs;

  indexChange(int idx) => currentIdx(idx);
}
