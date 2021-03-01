import 'package:flutter/material.dart';

import 'custom/center_circle.dart';

class FontSize extends StatefulWidget {
  FontSize() {
//    ScreenUtil.init(constraints)
  }

  @override
  _FontSizeState createState() => _FontSizeState();
}

class _FontSizeState extends State<FontSize> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          UnconstrainedBox(
            child: CustomPaint(
              painter: ColorPainter(),
              size: Size(300, 200),
            ),
          ),
          CenterCircles(),
        ],
      ),
    );
  }
}

class ColorPainter extends CustomPainter {
  final painter = Paint();

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTRB(0.0, 0.0, size.width, size.height);
    // 注意这一句
    canvas.clipRect(rect);
    painter.color = Colors.blue;
    canvas.drawRect(rect, painter);
    painter.color = Colors.red;
    canvas.drawCircle(Offset.zero, size.height, painter);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
