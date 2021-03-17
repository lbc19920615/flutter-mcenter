import 'package:flutter/widgets.dart';
import 'package:lbc_mcenter/components/transform_page_view/transform_info.dart';

const colorDefault = 0x00ffffff;

class ColorPainter extends CustomPainter {
  final Paint _paint;
  final TransformInfo transformInfo;
  final List<Color> colors;

  ColorPainter(this._paint, this.transformInfo, this.colors);

  @override
  void paint(Canvas canvas, Size size) {
    int index = transformInfo.fromIndex;
    _paint.color = colors[index];
    canvas.drawRect(
        new Rect.fromLTWH(0.0, 0.0, size.width, size.height), _paint);
    if (transformInfo.done) {
      return;
    }
    int alpha;
    int color;
    double opacity;
    double position = transformInfo.position;
    if (transformInfo.forward) {
      if (index < colors.length - 1) {
        color = colors[index + 1].value & colorDefault;
        opacity = (position <= 0
            ? (-position / transformInfo.viewportFraction)
            : 1 - position / transformInfo.viewportFraction);
        if (opacity > 1) {
          opacity -= 1.0;
        }
        if (opacity < 0) {
          opacity += 1.0;
        }
        alpha = (0xff * opacity).toInt();

        _paint.color = new Color((alpha << 24) | color);
        canvas.drawRect(
            new Rect.fromLTWH(0.0, 0.0, size.width, size.height), _paint);
      }
    } else {
      if (index > 0) {
        color = colors[index - 1].value & 0x00ffffff;
        opacity = (position > 0
            ? position / transformInfo.viewportFraction
            : (1 + position / transformInfo.viewportFraction));
        if (opacity > 1) {
          opacity -= 1.0;
        }
        if (opacity < 0) {
          opacity += 1.0;
        }
        alpha = (0xff * opacity).toInt();

        _paint.color = new Color((alpha << 24) | color);
        canvas.drawRect(
            new Rect.fromLTWH(0.0, 0.0, size.width, size.height), _paint);
      }
    }
  }

  @override
  bool shouldRepaint(ColorPainter oldDelegate) {
    return oldDelegate.transformInfo != transformInfo;
  }
}
