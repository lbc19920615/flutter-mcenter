import 'package:flutter/material.dart';
import 'package:lbc_mcenter/models/IconItem.dart';

final descTextStyle = TextStyle(
  color: Colors.red,
  fontWeight: FontWeight.w300,
  fontFamily: 'Roboto',
  letterSpacing: 0.5,
  fontSize: 16,
  height: 1,
);

var icons = [
  // {"icon": Icons.bar_chart, "name": "icon1"},
  // {"icon": Icons.bar_chart, "name": 'icon2'},
  // {"icon": Icons.bar_chart, "name": 'icon3'},
  IconItem(icon: Icons.bar_chart, name: 'icon1'),
  IconItem(icon: Icons.bar_chart, name: 'icon2'),
  IconItem(icon: Icons.bar_chart, name: 'icon3'),
];

class DemoPageBarPage extends StatefulWidget {
  @override
  _DemoPageBarPageState createState() => _DemoPageBarPageState();
}

class _DemoPageBarPageState extends State<DemoPageBarPage> {
  @override
  Widget build(BuildContext context) {
    var items = _buildBarItems();
    return Scaffold(
        appBar: AppBar(
          title: Text("Container"),
        ),
        body: DefaultTextStyle.merge(
            style: descTextStyle,
            child: Container(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: items))));
  }

  List<Widget> _buildBarItems() {
    var children = <Widget>[];
    icons.forEach((icon) {
      children.add(_buildBarItem(icon));
    });
    return children;
  }

  Widget _buildBarItem(IconItem item) {
    return Column(
        children: [Icon(item.icon), Container(child: Text(item.name))]);
  }
}
