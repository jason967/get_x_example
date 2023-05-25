import 'package:flutter/material.dart';

import '../common/widgets/sample_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          SampleWidget('샘플_1', Colors.blueGrey),
          SampleWidget('샘플_2', Colors.lime),
          SampleWidget('샘플_3', Colors.orange),
          SampleWidget('샘플_4', Colors.lightBlue),
          SampleWidget('샘플_5', Colors.redAccent),
        ],
      ),
    );
  }
}
