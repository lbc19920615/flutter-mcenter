import 'package:flutter/material.dart';
import 'package:lbc_mcenter/utils/constants.dart';

class ArticleDetailPage extends StatefulWidget {
  ArticleDetailPage({Key key}) : super(key: key);

  @override
  _ArticleDetailPageState createState() => _ArticleDetailPageState();
}

class _ArticleDetailPageState extends State<ArticleDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Constants.appName),
      ),
      body: Container(
        child: Text('sdsdsds'),
      ),
    );
  }
}
