import 'package:flutter/material.dart';
import 'package:lbc_mcenter/components/transform_page_view/page_transform_builder.dart';

const int kMaxValue = 2000000000;
const int kMiddleValue = 1000000000;

///  Default auto play transition duration (in millisecond)
const int kDefaultTransactionDuration = 300;

class TransformPageView extends StatefulWidget {
  /// Create a `transformed` widget base on the widget that has been passed to  the [PageTransformer.transform].
  /// See [TransformInfo]
  ///
  final PageTransformer transformer;

  /// Same as [PageView.scrollDirection]
  ///
  /// Defaults to [Axis.horizontal].
  final Axis scrollDirection;

  /// Same as [PageView.physics]
  final ScrollPhysics physics;

  TransformPageView(
      {Key key, this.transformer, this.scrollDirection, this.physics})
      : super(key: key);

  @override
  _TransformPageViewState createState() => _TransformPageViewState();
}

class _TransformPageViewState extends State<TransformPageView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('sdsdsdsds'),
    );
  }
}
