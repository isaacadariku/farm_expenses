import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// A Media Query Custom Class
///
/// for scaling text sizes and margins
///
/// to be responsive across different screens
class SizeConfig {
  /// -
  static double yMargin(BuildContext context, double height) {
    final screenHeight = MediaQuery.of(context).size.height / 100;
    return height * screenHeight;
  }

  /// -
  static double xMargin(BuildContext context, double width) {
    final screenWidth = MediaQuery.of(context).size.width / 100;
    return width * screenWidth;
  }

  /// -
  static double textSize(BuildContext context, double textSize) {
    final screenWidth = MediaQuery.of(context).size.width / 100;
    final screenHeight = MediaQuery.of(context).size.height / 100;
    if (screenWidth > screenHeight) {
      return textSize * screenHeight;
    } else {
      return textSize * screenWidth;
    }
  }
}

/// Contains useful functions to reduce boilerplate code
///
/// Returns a vertical space with [kHeight] set to [VerticalSpace]
class VerticalSpace extends StatelessWidget {
  /// -
  const VerticalSpace(this.kHeight, {Key key}) : super(key: key);

  /// -
  final double kHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: SizeConfig.yMargin(context, kHeight));
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DoubleProperty('kHeight', kHeight));
  }
}

/// Contains useful functions to reduce boilerplate code
///
/// Returns a vertical space with [kWidth] set to [HorizontalSpace]
class HorizontalSpace extends StatelessWidget {
  /// -
  const HorizontalSpace(this.kWidth, {Key key}) : super(key: key);

  /// -
  final double kWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: SizeConfig.xMargin(context, kWidth));
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DoubleProperty('kWidth', kWidth));
  }
}
