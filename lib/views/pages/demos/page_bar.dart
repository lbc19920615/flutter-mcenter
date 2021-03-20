import 'package:flutter/material.dart';

class DemoPageBarPage extends StatefulWidget {
  @override
  _DemoPageBarPageState createState() => _DemoPageBarPageState();
}

class _DemoPageBarPageState extends State<DemoPageBarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Container"),
        ),
        body: Container(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
              _buildBarItem(),
              _buildBarItem(),
              _buildBarItem(),
            ])));
  }

  Widget _buildBarItem() {
    return Column(
        children: [Icon(Icons.bar_chart), Container(child: Text('sdsdsds'))]);
  }
}
