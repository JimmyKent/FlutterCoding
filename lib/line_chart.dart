import 'dart:math';

import 'package:flutter/material.dart';

import 'bezier_chart/bezier_chart_config.dart';
import 'bezier_chart/bezier_chart_widget.dart';
import 'bezier_chart/bezier_line.dart';

class LineChart extends StatefulWidget {
  @override
  _LineChartState createState() => _LineChartState();
}

class _LineChartState extends State<LineChart> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: UnconstrainedBox(
        child: Container(
          width: 300,
          height: 100,
          color: Colors.purpleAccent,
          child: BezierChart(
            bezierChartScale: BezierChartScale.CUSTOM,
            xAxisCustomValues: const <double>[0, 5, 10, 15, 20, 25, 30],
            footerValueBuilder: (double value) => '',
            bubbleLabelValueBuilder: (double value) => '\n',
            series: [
              BezierLine(
                dataPointStrokeColor: Colors.orange,
                label: '元',
                data: _getRandomData(),
              ),
            ],
            config: BezierChartConfig(
              footerHeight: 0,
              showVerticalIndicator: false,
              verticalIndicatorFixedPosition: false,
              snap: true,
              backgroundColor: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }

  List<DataPoint> data = [];
  List<DataPoint> data1 = [];
  List<DataPoint> data2 = [];

  // 数据变化图标会刷新，否则不会
  List<DataPoint> _getRandomData() {
    if (data.isEmpty) {
      for (int i = 0; i < 7; i++) {
        data.add(DataPoint<double>(
            value: Random.secure().nextInt(3000).toDouble(), xAxis: (i * 5).toDouble()));
      }
      for (int i = 0; i < 7; i++) {
        data1.add(DataPoint<double>(
            value: Random.secure().nextInt(3000).toDouble(), xAxis: (i * 5).toDouble()));
      }
      for (int i = 0; i < 7; i++) {
        data2.add(DataPoint<double>(
            value: Random.secure().nextInt(3000).toDouble(), xAxis: (i * 5).toDouble()));
      }
    }

    return data;
  }
}
