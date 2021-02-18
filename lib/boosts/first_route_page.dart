import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';

class FirstRoutePage extends StatefulWidget {
  @override
  _FirstRoutePageState createState() => _FirstRoutePageState();
}

class _FirstRoutePageState extends State<FirstRoutePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      child: GestureDetector(
        onTap: () {
          FlutterBoost.singleton.open(
            "params",
            urlParams: <String, dynamic>{
              "pageIndex": 2
            },
          );
        },
        child: UnconstrainedBox(
          child: Container(
            width: 100,
            height: 20,
            color: Colors.deepOrange,
          ),
        ),
      ),
    );
  }
}
