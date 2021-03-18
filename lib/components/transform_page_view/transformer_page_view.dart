import 'package:flutter/material.dart';
import 'package:lbc_mcenter/components/transform_page_view/index_controller.dart';
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

  /// Set to false to disable page snapping, useful for custom scroll behavior.
  /// Same as [PageView.pageSnapping]
  final bool pageSnapping;

  /// Called whenever the page in the center of the viewport changes.
  /// Same as [PageView.onPageChanged]
  final ValueChanged<int> onPageChanged;

  /// itemBuilder as PageView.itemBuilder
  final IndexedWidgetBuilder itemBuilder;

  // See [IndexController.mode],[IndexController.next],[IndexController.previous]
  final IndexController controller;

  /// Animation duration
  final Duration duration;

  /// Animation curve
  final Curve curve;

  /// Set true to open infinity loop mode.
  final bool loop;

  /// This value is only valid when `pageController` is not set,
  final int itemCount;

  TransformPageView(
      {Key key,
      this.transformer,
      this.scrollDirection,
      this.physics,
      this.pageSnapping,
      this.onPageChanged,
      this.itemBuilder,
      this.controller,
      this.duration,
      this.curve,
      this.loop,
      this.itemCount})
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
