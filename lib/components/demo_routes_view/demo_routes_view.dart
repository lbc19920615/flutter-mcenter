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
      child: Column(children: _buttonList()),
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
