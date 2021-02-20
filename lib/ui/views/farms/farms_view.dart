import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../shared/widgets/app_bar_widget.dart';
import '../../shared/const_color.dart';
import '../../shared/widgets/status_bar_widget.dart';
import '../../shared/const_text_style.dart';

import 'farms_viewmodel.dart';

/// -
class FarmsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FarmsViewModel>.nonReactive(
      builder: (context, model, child) => StatusBar(
        barColor: BrandColors.kPrimary,
        isStatusIconLight: true,
        child: SafeArea(
          child: Scaffold(
            appBar: farmExpensesAppBar(context, leading: 'Farms'),
            body:  Center(
              child: Text(
                'Farms',
                style: kHeaderTextStyle(context, color: BrandColors.kPrimary),
              ),
            ),
          ),
        ),
      ),
      viewModelBuilder: () => FarmsViewModel(),
    );
  }
}
