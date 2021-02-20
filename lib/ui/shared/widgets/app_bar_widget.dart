import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../const_color.dart';
import '../const_text_style.dart';

Widget farmExpensesAppBar(context, {@required String leading}) {
  return AppBar(
    automaticallyImplyLeading: false,
    title: Text(
      leading,
      style: kSubHeadingTextStyle(context, isNormal: false, color: ThemeColors.kWhite),
    ),
    actions: [
      Stack(
        alignment: AlignmentDirectional.center,
        children: [
          IconButton(
            icon: const Icon(Icons.notifications_none, size: 28, color: Colors.white),
            onPressed: () {},
          ),
          Positioned(
            top: 10,
            right: 10,
            width: 8,
            height: 8,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.greenAccent,
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
