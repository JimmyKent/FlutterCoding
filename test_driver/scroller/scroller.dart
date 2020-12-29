import 'package:flutter_driver/driver_extension.dart';
import 'package:flutter_coding/main.dart' as app;
/**
    https://flutter.cn/docs/cookbook/testing/unit/introduction 单元测试介绍
    https://flutter.cn/docs/cookbook/testing/integration/scrolling 列表滚动
    https://flutter.cn/docs/cookbook/testing/integration/profiling 性能分析
 */
/// 运行 flutter drive --target=test_driver/scroller/scroller.dart --profile
void main() {
  enableFlutterDriverExtension();
  app.main();
}