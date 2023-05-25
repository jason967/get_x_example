import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_example/counter/counter.controller.dart';

class Counter extends StatelessWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final counter = Get.put(CounterController());
    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () => Text('클릭 횟수: ${counter.count}'),
        ),
      ),
    );
  }
}
