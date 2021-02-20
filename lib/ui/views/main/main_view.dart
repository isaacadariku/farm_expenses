import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:animations/animations.dart';

import '../../shared/const_color.dart';
import '../../shared/const_text_style.dart';
import '../farms/farms_view.dart';
import '../home/home_view.dart';
import '../more/more_view.dart';
import '../reports/reports_view.dart';

import 'main_viewmodel.dart';

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      builder: (context, model, child) => WillPopScope(
        onWillPop: () async => model.onWillPop(model.currentIndex),
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: Text(
              '\u{20B9}',
              style: kHeaderTextStyle(
                context,
                size: 12,
                color: ThemeColors.kWhite,
              ),
            ),
            backgroundColor: BrandColors.kPrimary,
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          body: PageTransitionSwitcher(
              duration: const Duration(milliseconds: 100),
              reverse: model.reverse,
              transitionBuilder: (
                Widget child,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
              ) {
                return SharedAxisTransition(
                  child: child,
                  animation: animation,
                  secondaryAnimation: secondaryAnimation,
                  transitionType: SharedAxisTransitionType.horizontal,
                );
              },
              child: getViewForIndex(model.currentIndex, model)),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: ThemeColors.kUnSelectedColor.withOpacity(0.8),
            selectedItemColor: model.isIndexSelected(model.currentIndex) ? ThemeColors.kSelectedColor : ThemeColors.kWhite,
            unselectedItemColor: ThemeColors.kWhite,
            selectedLabelStyle: kBodyTextStyle(context, color: ThemeColors.kWhite),
            unselectedLabelStyle: kBodyTextStyle(context, color: ThemeColors.kWhite),
            currentIndex: model.currentIndex,
            onTap: model.setIndex,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.description),
                label: 'Reports',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.moped),
                label: 'Farms',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.more_vert),
                label: 'More',
              ),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => MainViewModel(),
    );
  }

  Widget getViewForIndex(int index, MainViewModel model) {
    switch (index) {
      case 0:
        return HomeView();
      case 1:
        return ReportsView();
      case 2:
        return FarmsView();
      case 3:
        return MoreView();
      default:
        return HomeView();
    }
  }
}
