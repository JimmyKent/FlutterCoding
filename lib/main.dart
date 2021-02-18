import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_boost/flutter_boost.dart';
import 'package:flutter_coding/boosts/params_route_page.dart';
import 'package:flutter_coding/countdown_opt.dart';
import 'package:flutter_coding/boosts/first_route_page.dart';
import 'package:flutter_coding/simple_bar_chart.dart';

import 'font_size.dart';
import 'line_chart.dart';
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

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    FlutterBoost.singleton.registerPageBuilders({
      'first': (String pageName, params, uniqueId) {
        return FirstRoutePage();
      },
      'params': (String pageName, params, uniqueId) {
        return ParamsRoutePage(params['pageIndex']);
      },
    });
  }

  @override
  Widget build(BuildContext context) {
    return WidgetsApp(
      title: 'Flutter Boost example',
      builder: FlutterBoost.init(postPush: _onRoutePushed),
      color: Colors.white,
      localizationsDelegates: [DefaultMaterialLocalizations.delegate],
      onUnknownRoute: (RouteSettings settings) {
        if (settings.name == "/") {
          return unKnownRoute(settings);
        }
        return PageRouteBuilder<dynamic>(
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return Material(
              color: Colors.brown,
              child: MyHomePage(title: 'Flutter Demo Home Page'),
            );
          },
        );
      },
//        home: Container(),
    );
//    return MaterialApp(
//      title: 'Flutter Demo',
//      theme: ThemeData(
//        primarySwatch: Colors.blue,
//        visualDensity: VisualDensity.adaptivePlatformDensity,
//      ),
//      home: MyHomePage(title: 'Flutter Demo Home Page'),
//    );
  }

  Route unKnownRoute(RouteSettings settings) {
    return PageRouteBuilder<dynamic>(
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return Material(
          color: Colors.brown,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "First Page",
              ),
              const Padding(padding: const EdgeInsets.all(10.0)),
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  color: Colors.blue,
                  child: const Text("Back"),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  void _onRoutePushed(String pageName, String uniqueId, Map params, Route route, Future _) {}
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
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
              key: globalKey1,
              //指定获取宽高的key
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
                Navigator.push(
                    context,
                    MaterialPageRoute<void>(
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
