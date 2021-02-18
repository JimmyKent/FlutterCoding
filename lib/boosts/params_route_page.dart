import 'package:flutter/material.dart';

class ParamsRoutePage extends StatelessWidget {
  const ParamsRoutePage(this.pageIndex);

  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Text(
        '这是第 $pageIndex 页',
        style: TextStyle(
          color: Colors.blue,
        ),
      ),

    );
  }
}
