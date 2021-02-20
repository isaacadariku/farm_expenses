import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app/locator.dart';
import 'app/router.dart' as app_router;
import 'ui/shared/const_color.dart';

Future<void> main() async {
  try {
    // Register all the models and services before the app starts
    await setupLocator();

    runApp(const MyApp());
  } catch (error) {
    debugPrint('Locator setup has failed');
  }
}

/// The base material class
class MyApp extends StatelessWidget {
  /// Init const
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Farm Expenses',
      theme: ThemeData(
        primaryColor: BrandColors.kPrimary,
        brightness: Brightness.light,
        accentColor: BrandColors.kPrimary,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: app_router.Routes.startupViewRoute,
      onGenerateRoute: app_router.Router().onGenerateRoutes,
      navigatorKey: StackedService.navigatorKey,
    );
  }
}
