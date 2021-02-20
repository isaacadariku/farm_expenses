import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../shared/const_color.dart';
import '../../shared/screen_size.dart';
import '../../shared/const_text_style.dart';

import 'startup_viewmodel.dart';

/// -
class StartupView extends StatelessWidget {
  /// -
  const StartupView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartupViewModel>.nonReactive(
      builder: (context, model, child) => Scaffold(
        backgroundColor: ThemeColors.kBackground,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Farm Expenses',
                style: kHeaderTextStyle(context).copyWith(color: ThemeColors.kWhite),
              ),
              const VerticalSpace(6),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => StartupViewModel(),
      onModelReady: (model) => model.setup(),
    );
  }
}
