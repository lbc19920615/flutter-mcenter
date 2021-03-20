import 'package:flutter/material.dart';
import 'package:lbc_mcenter/utils/router.dart';

class DemoRoutesView extends StatefulWidget {
  @override
  _DemoRoutesViewState createState() => _DemoRoutesViewState();
}

class _DemoRoutesViewState extends State<DemoRoutesView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: SingleChildScrollView(
          //滑动的方向 Axis.vertical为垂直方向滑动，Axis.horizontal 为水平方向
          scrollDirection: Axis.vertical,
          child: Column(children: _buttonList())),
    );
  }

  List<Widget> _buttonList() {
    var keys = appRoutes.keys.toList();

    List<Widget> list = [];

    keys.forEach((key) {
      list.add(TextButton(
        child: Text('navigate to $key'),
        onPressed: () {
          Navigator.pushNamed(context, key);
        },
      ));
    });

    return list;
  }
}
