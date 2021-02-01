import 'package:flutter/material.dart';


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
      child: Container(
        color: Colors.orange,
        child: Text('123'),
      ),
    );
  }


}
