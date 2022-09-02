import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AppSizes {
  static final double verticalMargin = 2.h;
  static final double horizontalMargin = 6.w;
  static final double buttonHeight = 6.h;
  static final double fullWidth = 100.w;

  static final double circleRadius = 2.0.h;
  static final double rectRadius = 1.2.h;
  static final circularBorderRadius = BorderRadius.circular(
    AppSizes.circleRadius,
  );
  static final recBorderRadius = BorderRadius.circular(AppSizes.rectRadius);
}
