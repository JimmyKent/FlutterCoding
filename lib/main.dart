import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_coding/countdown_opt.dart';
import 'package:flutter_coding/simple_bar_chart.dart';

import 'font_size.dart';
import 'line_chart.dart';
import 'pixel/Inner_widgets_flutter_binding.dart';
import 'pixel2/pixel_adapt.dart';
import 'scroller_page.dart';

void main() {
  debugProfileBuildsEnabled = true;
  // 在Android和iOS真机不能出现paint图,模拟器可以
  debugProfilePaintsEnabled = true;
  debugPaintLayerBordersEnabled = true;
  PixelAdapter.initWidth(1242);

//  InnerWidgetsFlutterBinding.initPixel(1242, 3);
//  InnerWidgetsFlutterBinding.ensureInitialized()
//    ..attachRootWidget(MyApp())
//    ..scheduleWarmUpFrame();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  int _counter = 0;
  bool playing = false;
  AnimationController animCtrl;
  Animation<double> animation;
  final GlobalKey globalKey1 = GlobalKey();
  final GlobalKey globalKey2 = GlobalKey();

  @override
  void initState() {
    super.initState();
    animCtrl = AnimationController(duration: const Duration(milliseconds: 500), vsync: this);
    animation = Tween<double>(begin: 1.0, end: 0.0).animate(animCtrl);
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute<void>(
                  builder: (_) {
                    return ScrollerPage();
                  },
                ));
              },
              child: Text('Scroller Test'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute<void>(
                  builder: (_) {
                    return SimpleBarChart.withSampleData();
                  },
                ));
              },
              child: Text('SimpleBarChart'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute<void>(
                  builder: (_) {
                    return LineChart();
                  },
                ));
              },
              child: Text('LineChart'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute<void>(
                  builder: (_) {
                    return CountdownOptPage();
                  },
                ));
              },
              child: Text('Countdown optimization'),
            ),
            LimitedBox(maxHeight: 20),
            GestureDetector(
              onTap: () {
                if (playing) {
                  animCtrl.forward();
                } else {
                  animCtrl.reverse();
                }
              },
              child: AnimatedIcon(
                icon: AnimatedIcons.play_pause,
                color: Colors.orange,
                progress: animation,
              ),
            ),
            Container(
              key: globalKey1, //指定获取宽高的key
              width: 200,
              height: 200,
              color: Colors.blue,
              alignment: Alignment.center,
              child: Stack(
                alignment: Alignment.topLeft,
                children: [
                  Container(
                    width: 180.9.px,
                    height: 180.9.px,
                    color: Colors.orange,
                  ),
                  Container(
                    width: 180.1.px,
                    height: 180.1.px,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            Container(
              key: globalKey2, //指定获取宽高的key
              width: 1000.9.px,
              height: 10,
              color: Colors.black,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute<void>(
                  settings: RouteSettings(),
                  builder: (_) {
                    return FontSize();
                  },
                ));
                getWh();
              },
              child: Container(
                width: 200,
                height: 200,
                color: Colors.brown,
                child: Text('FontSize'),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  double fromPixel(int num) {
    return num.px;
  }

  void getWh() {
    final containerWidth = globalKey1.currentContext.size.width;
    final containerHeight = globalKey1.currentContext.size.height;
    //FadeTransition width is 480.0, height is 100.0
    print('width is $containerWidth, height is $containerHeight ');

    final MediaQueryData mediaQuery = MediaQueryData.fromWindow(window);
    print('width is ${mediaQuery.size}');
    PixelAdapter.debugString();
  }
}
