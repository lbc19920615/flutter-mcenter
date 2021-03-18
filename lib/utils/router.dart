import 'package:flutter/cupertino.dart';
import 'package:lbc_mcenter/views/pages/article_detail.dart';
import 'package:lbc_mcenter/views/pages/home.dart';

Map<String, Widget Function(BuildContext)> appRoutes = {
  '/': (context) => HomePage(),
  '/article_detail': (context) => ArticleDetailPage(
        key: null,
      )
};
