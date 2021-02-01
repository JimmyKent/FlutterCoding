library dart.pixel_adapt;

import 'dart:ui';
import 'package:flutter/material.dart';

extension PixelAdapter on num {
  static final MediaQueryData _mediaQuery = MediaQueryData.fromWindow(window);

  /// 这个值是dp值, 最后还要 * pixelRatio 才对
  /// 这里不能用window.size是因为window.size获得的是px值,
  /// 最后显示的时候,WidgetsFlutterBinding#createViewConfiguration会把我们写的值乘以devicePixelRatio
  static final double _width = _mediaQuery.size.width;
  static double _ratioW;

  static void initWidth(int designWidth) {
    _ratioW = _width / designWidth;
  }

  double get px {
    assert(_ratioW != null, 'You should call initWidth first!');
    return this * _ratioW;
  }

  static void debugString() {
    print('_width: $_width, _ratioW: $_ratioW ${window.physicalSize}');
  }
}

class Sample {
  void main() {
    PixelAdapter.initWidth(1242);
    const int designWidth = 20; // 20px
    final double realWidth = 20.px;
    print('designWidth: $designWidth, realWidth: $realWidth');
  }

  Widget rectangle() {
    return Container(
      width: 20.px,
      height: 20.px,
    );
  }
}
