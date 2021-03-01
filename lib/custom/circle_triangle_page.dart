import 'package:flutter/material.dart';

import 'circle_triangle.dart';
import 'size_const.dart';

class CircleTrianglePage extends StatefulWidget {
  @override
  _CircleTriangleState createState() => _CircleTriangleState();
}

class _CircleTriangleState extends State<CircleTrianglePage> {
  double _len = 0.0;
  double _x = 0.0;
  double _y = 0.0;

  @override
  void initState() {
    super.initState();
    SizeUtil.initDesignSize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('三角形转盘'),
      ),
      body: Container(
          child: Center(
        child: GestureDetector(
          onHorizontalDragStart: (detail) {
            _x = detail.globalPosition.dx;
          },
          onVerticalDragStart: (detail) {
            _y = detail.globalPosition.dy;
          },
          onHorizontalDragUpdate: (detail) {
            setState(() {
              _len -= detail.globalPosition.dx - _x;
              _x = detail.globalPosition.dx;
            });
          },
          onVerticalDragUpdate: (detail) {
            setState(() {
              _len += detail.globalPosition.dy - _y;
              _y = detail.globalPosition.dy;
            });
          },
          child: Container(
            width: 300,
            height: 300,
            child: CustomPaint(
              painter: (CircleTrianglePainter(scrollLen: _len)),
              size: Size(300, 300),
            ),
          ),
        ),
      )),
    );
  }
}
