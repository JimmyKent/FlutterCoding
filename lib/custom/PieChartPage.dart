import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'PieChartWidget.dart';

/// https://blog.csdn.net/iamdingruihaha/article/details/100828106
class PieChartPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BingTuPageState();
  }
}

class _BingTuPageState extends State<PieChartPage> {
  List<double> angles;

  List<Color> colors;
  List<String> contents;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    colors = [Colors.red, Colors.cyan, Colors.black, Colors.yellow, Colors.grey];
    angles = [1 / 7, 2 / 7, 2 / 7, 1 / 14, 3 / 14];
    contents = ["梁朝伟", "刘德华", "郭富城", "周星驰", "张学友"];
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: PieChartWidget(angles, colors, startTurns: .0, radius: 130, contents: contents));
  }
}
