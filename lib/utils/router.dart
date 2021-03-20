import 'package:flutter/cupertino.dart';
import 'package:lbc_mcenter/views/pages/article_detail.dart';
import 'package:lbc_mcenter/views/pages/demos/page_bar.dart';
import 'package:lbc_mcenter/views/pages/demos/page_container.dart';
import 'package:lbc_mcenter/views/pages/home.dart';

Map<String, Widget Function(BuildContext)> appRoutes = {
  '/': (context) => HomePage(),
  '/article_detail': (context) => ArticleDetailPage(
        key: null,
      ),
  '/demo_page_container': (context) => DemoPageContainer(),
  '/demo_page_bar': (context) => DemoPageBarPage()
};
