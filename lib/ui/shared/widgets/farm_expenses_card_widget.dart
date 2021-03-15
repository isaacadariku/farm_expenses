import 'package:flutter/material.dart';

import '../const_color.dart';
import '../const_text_style.dart';

class FarmExpensesCard extends StatelessWidget {
  const FarmExpensesCard({Key key, @required this.date, @required this.expensesType, @required this.amount, @required this.isIncome}) : super(key: key);

  final String date;
  final String expensesType;
  final String amount;
  final bool isIncome;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Container(
        padding: EdgeInsets.only(left: 18, right: 10),
        height: 85.0,
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(
              width: 5.0,
              color: isIncome ? BrandColors.kPrimary : BrandColors.kSecondary,
            ),
            right: BorderSide(width: 2.0, color: ThemeColors.kWhite[400]),
            bottom: BorderSide(width: 0.0, color: ThemeColors.kWhite),
            top: BorderSide(width: 0.0, color: ThemeColors.kWhite),
          ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 1.0,
            ),
          ],
        ),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    expensesType,
                    style: kSubHeadingTextStyle(context, isNormal: false),
                  ),
                  Text(
                    date,
                    style: kBodyTextStyle(context),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    isIncome ? 'Total Income' : 'Total Expenses',
                    style: kBodyTextStyle(context),
                  ),
                  Text(
                    '\u{20B9} $amount',
                    style: kSubHeadingTextStyle(
                      context,
                      color: isIncome ? BrandColors.kPrimary : BrandColors.kSecondary,
                      isNormal: false,
                    ),
                  )
                ],
              ),
            ),
            PopupMenuButton(
              onSelected: (object) {},
              itemBuilder: (BuildContext context) {
                List<PopupMenuEntry<Object>> list = <PopupMenuEntry<Object>>[
                  PopupMenuItem(
                    value: 'test',
                    child: Text(
                      "Test",
                      style: kBodyTextStyle(context),
                    ),
                  ),
                ];
                return list;
              },
            ),
          ],
        ),
      ),
    );
  }
}
