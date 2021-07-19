import 'package:flutter/cupertino.dart';
import 'package:image_editor_pro/modules/color_filter_generator.dart';

Widget imageFilterAdjust({brightness, saturation, hue, child}) {
  return ColorFiltered(
    colorFilter: ColorFilter.matrix(
      ColorFilterGenerator.brightnessAdjustMatrix(value: brightness),
    ),
    child: ColorFiltered(
      colorFilter: ColorFilter.matrix(
        ColorFilterGenerator.saturationAdjustMatrix(value: saturation),
      ),
      child: ColorFiltered(
        colorFilter: ColorFilter.matrix(
          ColorFilterGenerator.hueAdjustMatrix(value: hue),
        ),
        child: child,
      ),
    ),
  );
}
