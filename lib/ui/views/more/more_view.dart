import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../shared/screen_size.dart';
import '../../shared/widgets/farm_expenses_card_widget.dart';
import '../../shared/widgets/app_bar_widget.dart';
import '../../shared/const_color.dart';
import '../../shared/widgets/status_bar_widget.dart';
import '../../shared/const_text_style.dart';

import 'more_viewmodel.dart';

/// -
class MoreView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MoreViewModel>.reactive(
      builder: (context, model, child) => StatusBar(
        barColor: BrandColors.kPrimary,
        isStatusIconLight: true,
        child: SafeArea(
          child: Scaffold(
            appBar: farmExpensesAppBar(context, leading: 'Farm Expenses'),
            body: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: SizeConfig.yMargin(context, 15),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
                  color: BrandColors.kPrimary.withOpacity(0.1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buildColumn(
                        context,
                        amount: '\u{20B9} 80, 000',
                        isIncome: true,
                      ),
                      Expanded(child: VerticalDivider()),
                      buildColumn(
                        context,
                        amount: '\u{20B9} 20, 000',
                        isIncome: false,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Text(
                          'Expenses Type',
                          style: kSubHeadingTextStyle(context, isNormal: false),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          'Amount',
                          style: kSubHeadingTextStyle(context, isNormal: false),
                        ),
                      ),
                      IconButton(icon: Icon(Icons.swap_vert), onPressed: () {}),
                      IconButton(icon: Icon(Icons.picture_as_pdf), onPressed: () {}),
                    ],
                  ),
                ),
                Container(
                  child: Expanded(
                    child: ListView(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.xMargin(context, 5),
                        vertical: SizeConfig.yMargin(context, 0.1),
                      ),
                      key: PageStorageKey('farmexpenses'),
                      children: model.farmExpensesRecords
                          .map((farmExpensesRecords) => FarmExpensesCard(
                              amount: farmExpensesRecords.amount,
                              date: farmExpensesRecords.date,
                              expensesType: farmExpensesRecords.expensesType,
                              isIncome: farmExpensesRecords.isIncome))
                          .toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => MoreViewModel(),
    );
  }

  Widget buildColumn(BuildContext context, {@required String amount, @required bool isIncome}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          amount,
          style: kHeaderTextStyle(context, color: isIncome ? BrandColors.kPrimary : BrandColors.kSecondary),
        ),
        Text(isIncome ? 'Total Income' : 'Total Expenses', style: kBodyTextStyle(context))
      ],
    );
  }
}
