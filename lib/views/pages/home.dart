import 'package:flutter/material.dart';
import 'package:lbc_mcenter/components/demo_routes_view/demo_routes_view.dart';

import 'package:lbc_mcenter/var.dart';

// import 'package:lbc_mcenter/components/simple_swiper_view/simple_swiper_view.dart';

import 'package:lbc_mcenter/components/transform_page_view/transformer_page_view.dart';
import 'package:lbc_mcenter/buildin_transformers.dart';

import 'package:lbc_mcenter/utils/constants.dart';
import 'package:uuid/uuid.dart';

var uuid = Uuid();

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> _suggestions = <String>[];
  final Set<String> _saved = new Set<String>();
  final TextStyle _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Constants.appName),
        actions: <Widget>[
          // 新增代码开始 ...
          new IconButton(icon: const Icon(Icons.list), onPressed: _pushSaved),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        // SimpleSwiperView(),
        Container(
          height: 200,
          child: TransformerPageView(
              loop: true,
              transformer: ScaleAndFadeTransformer(),
              viewportFraction: 0.8,
              itemBuilder: (BuildContext context, int index) {
                var i = index % colorList.length;
                return new Container(
                  color: colorList[i],
                  child: Image.asset(
                    bannerImages[i],
                    fit: BoxFit.cover,
                  ),
                );
              },
              itemCount: 3),
        ),
        DemoRoutesView(),
        Container(height: 300, child: _buildList()),
      ],
    );
  }

  Widget _buildList() {
    return new ListView.builder(
        padding: EdgeInsets.all(Constants.commonPadding),
        itemBuilder: (BuildContext _context, int i) {
          if (i.isOdd) {
            return const Divider();
          }
          final int index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.add(uuid.v1());
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(String suggestion) {
    final bool alreadySaved = _saved.contains(suggestion); // 新增本行
    return new ListTile(
      title: new Text(
        suggestion,
        style: _biggerFont,
      ),
      trailing: new Icon(
        // 新增代码开始 ...
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(suggestion);
          } else {
            _saved.add(suggestion);
          }
        });
      },
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      new MaterialPageRoute<void>(
        builder: (BuildContext context) {
          final Iterable<ListTile> tiles = _saved.map(
            (String suggestion) {
              return new ListTile(
                title: new Text(
                  suggestion,
                  style: _biggerFont,
                ),
              );
            },
          );
          final List<Widget> divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();

          return new Scaffold(
            // 新增 6 行代码开始 ...
            appBar: new AppBar(
              title: const Text('Saved Suggestions'),
            ),
            body: new ListView(children: divided),
          ); // ... 新增代码段结束.
        },
      ),
    );
  }
}
