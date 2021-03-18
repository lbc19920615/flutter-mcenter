import 'package:flutter/material.dart';
import 'components/transform_page_view/transformer_page_view.dart';

class AccordionTransformer extends PageTransformer {
  @override
  Widget transform(Widget child, TransformInfo info) {
    double? position = info.position;
    if (position == null) {
      throw new StateError('position');
    }
    if (position < 0.0) {
      return new Transform.scale(
        scale: 1 + position,
        alignment: Alignment.topRight,
        child: child,
      );
    } else {
      return new Transform.scale(
        scale: 1 - position,
        alignment: Alignment.bottomLeft,
        child: child,
      );
    }
  }
}

class ZoomInPageTransformer extends PageTransformer {
  static const double ZOOM_MAX = 0.5;
  @override
  Widget transform(Widget child, TransformInfo info) {
    double? position = info.position;
    double? width = info.width;
    if (position == null) {
      throw new StateError('position');
    }
    if (width == null) {
      throw new StateError('width');
    }
    if (position > 0 && position <= 1) {
      return new Transform.translate(
        offset: new Offset(-width * position, 0.0),
        child: new Transform.scale(
          scale: 1 - position,
          child: child,
        ),
      );
    }
    return child;
  }
}

class ScaleAndFadeTransformer extends PageTransformer {
  final double _scale;
  final double _fade;

  ScaleAndFadeTransformer({double fade: 0.3, double scale: 0.8})
      : _fade = fade,
        _scale = scale;

  @override
  Widget transform(Widget item, TransformInfo info) {
    double? position = info.position;
    if (position == null) {
      throw new StateError('position');
    }
    double scaleFactor = (1 - position.abs()) * (1 - _scale);
    double fadeFactor = (1 - position.abs()) * (1 - _fade);
    double opacity = _fade + fadeFactor;
    double scale = _scale + scaleFactor;
    return new Opacity(
      opacity: opacity,
      child: new Transform.scale(
        scale: scale,
        child: item,
      ),
    );
  }
}
