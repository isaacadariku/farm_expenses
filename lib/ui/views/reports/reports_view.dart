import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../shared/widgets/app_bar_widget.dart';
import '../../shared/const_color.dart';
import '../../shared/widgets/status_bar_widget.dart';
import '../../shared/const_text_style.dart';

import 'reports_viewmodel.dart';


/// -
class ReportsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ReportsViewModel>.nonReactive(
      builder: (context, model, child) => StatusBar(
        barColor: BrandColors.kPrimary,
        isStatusIconLight: true,
        child: SafeArea(
          child: Scaffold(
            appBar: farmExpensesAppBar(context,leading: 'Reports'),
            body: Center(
              child: Text(
                'Reports',
                style: kHeaderTextStyle(context, color: BrandColors.kPrimary),
              ),
            ),
          ),
        ),
      ),
      viewModelBuilder: () => ReportsViewModel(),
    );
  }
}
