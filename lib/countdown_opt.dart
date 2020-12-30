import 'dart:async';

import 'package:flutter/material.dart';

class CountdownOptPage extends StatefulWidget {
  @override
  _CountdownOptPageState createState() => _CountdownOptPageState();
}

class _CountdownOptPageState extends State<CountdownOptPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: Stack(
          children: [
            Image.asset(
              'assets/images/app_start_1.webp',
            ),
            Image.asset(
              'assets/images/logo.png',
            ),
            RepaintBoundary(
              child: Container(
                alignment: Alignment.center,
                child: CountdownText(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CountdownText extends StatefulWidget {
  @override
  _CountdownTextState createState() => _CountdownTextState();
}

class _CountdownTextState extends State<CountdownText> {
  int count = 0;

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          count++;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      count.toString(),
    );
  }
}
