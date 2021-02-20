import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../shared/const_text_style.dart';
import '../../shared/widgets/app_bar_widget.dart';
import '../../shared/const_color.dart';
import '../../shared/widgets/status_bar_widget.dart';
import 'home_viewmodel.dart';

/// -
class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.nonReactive(
      builder: (context, model, child) => StatusBar(
        barColor: BrandColors.kPrimary,
        isStatusIconLight: true,
        child: SafeArea(
          child: Scaffold(
            appBar: farmExpensesAppBar(context, leading: 'Dashboard'),
            body: Center(
              child: Text(
                'Dashboard',
                style: kHeaderTextStyle(context, color: BrandColors.kPrimary),
              ),
            ),
          ),
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
