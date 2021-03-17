import 'package:flutter/widgets.dart';
import 'package:lbc_mcenter/components/transform_page_view/transform_info.dart';

abstract class PageTransformer {
  ///
  final bool reverse;

  PageTransformer({this.reverse: false});

  /// Return a transformed widget, based on child and TransformInfo
  Widget transform(Widget child, TransformInfo info);
}

typedef Widget PageTransformerBuilderCallback(Widget child, TransformInfo info);

class PageTransformerBuilder extends PageTransformer {
  final PageTransformerBuilderCallback builder;

  PageTransformerBuilder({bool reverse: false, @required this.builder})
      : assert(builder != null),
        super(reverse: reverse);

  @override
  Widget transform(Widget child, TransformInfo info) {
    return builder(child, info);
  }
}
