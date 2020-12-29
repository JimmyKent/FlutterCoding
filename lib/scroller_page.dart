import 'package:flutter/material.dart';

class ScrollerPage extends StatefulWidget {
  @override
  _ScrollerPageState createState() => _ScrollerPageState();
}

class _ScrollerPageState extends State<ScrollerPage> {
  final title = 'Long List';
  List<String> items;

  @override
  void initState() {
    super.initState();
    items = List<String>.generate(10000, (i) => "Item $i");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.builder(
          // Add a key to the ListView. This makes it possible to
          // find the list and scroll through it in the tests.
          key: Key('long_list'),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                '${items[index]}',
                // Add a key to the Text widget for each item. This makes
                // it possible to look for a particular item in the list
                // and verify that the text is correct
                key: Key('item_${index}_text'),
              ),
            );
          },
        ),
      ),
    );
  }
}
