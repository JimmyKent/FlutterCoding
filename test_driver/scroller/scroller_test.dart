// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Scrollable App', () {
    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
      await driver.waitUntilFirstFrameRasterized();
    });
    tearDown(() {
      print('< Success');
    });
    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        await driver.close();
      }
    });

    test('scroll', () async {
      await driver.tap(find.text('Scroller Test'));
      final Timeline timeline = await driver.traceAction(() async {
//        await driver.tap(find.text('Material'));

        final SerializableFinder demoList = find.byValueKey('long_list');

        // TODO(eseidel): These are very artificial scrolls, we should use better
        // https://github.com/flutter/flutter/issues/3316
        // Scroll down
        for (int i = 0; i < 5; i++) {
          await driver.scroll(demoList, 0.0, -300.0, const Duration(milliseconds: 300));
          await Future<void>.delayed(const Duration(milliseconds: 500));
        }

        // Scroll up here has bug
        for (int i = 0; i < 5; i++) {
          await driver.scroll(demoList, 0.0, 300.0, const Duration(milliseconds: 300));
          await Future<void>.delayed(const Duration(milliseconds: 500));
        }
      });

      // 在测试代码运行成功以后，在项目根目录下的 build 文件夹里包含以下两个文件：
      // scrolling_summary.timeline_summary.json 包含摘要。可以使用任何文本编辑器打开它并查看其中包含的信息。
      // 通过更高级的设置，我们可以在每次测试时保存摘要并创建一个结果图。
      //
      // scrolling_timeline.timeline.json 包含完整的时间轴数据。使用 Chorme 浏览器的追踪工具打开这个文件。
      // 追踪工具在这里：chrome://tracing。追踪工具提供了一个便捷的用户界面，用以检测时间轴数据并发现其中导致性能问题的源头。
      final TimelineSummary summary = TimelineSummary.summarize(timeline);
      await summary.writeSummaryToFile('home_scroll_perf', pretty: true);
      await summary.writeTimelineToFile('home_scroll_perf', pretty: true);
    });

    test('verifies the list contains a specific item', () async {
      // Create two SerializableFinders and use these to locate specific
      // widgets displayed by the app. The names provided to the byValueKey
      // method correspond to the Keys provided to the widgets in step 1.
      final listFinder = find.byValueKey('long_list');
      final itemFinder = find.byValueKey('item_50_text');

      await driver.scrollUntilVisible(
        // Scroll through the list
        listFinder,
        // Until finding this item
        itemFinder,
        // To scroll down the list, provide a negative value to dyScroll.
        // Ensure that this value is a small enough increment to
        // scroll the item into view without potentially scrolling past it.
        //
        // To scroll through horizontal lists, provide a dxScroll
        // property instead.
        dyScroll: -300.0,
      );

      // Verify that the item contains the correct text.
      expect(
        await driver.getText(itemFinder),
        'Item 50',
      );
    });
  });
}
