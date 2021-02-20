import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StatusBar extends StatelessWidget {
  const StatusBar({Key key, @required this.barColor, @required this.isStatusIconLight, @required this.child}) : super(key: key);

  final Widget child;
  final Color barColor;
  final bool isStatusIconLight;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: barColor,
          statusBarIconBrightness: isStatusIconLight ? Brightness.light : Brightness.dark,
        ),
        child: child);
  }
}
