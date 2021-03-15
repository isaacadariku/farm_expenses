import 'package:farmexpenses/ui/views/main/main_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../ui/views/startup/startup_view.dart';

///
abstract class Routes {
  ///
  static const startupViewRoute = '/';

  ///
  static const mainViewRoute = '/main-view';
}

///
class Router {
  ///
  Route<dynamic> onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.startupViewRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const StartUpView(),
          settings: settings,
        );
      case Routes.mainViewRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => MainView(),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}

/// Returns an error page Routes with a helper message.
/// [404] page
PageRoute unknownRoutePage(String routeName) => CupertinoPageRoute<dynamic>(
      builder: (ctx) => Scaffold(
        body: Container(
          color: Colors.redAccent,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                child: Text(
                  routeName == '/'
                      ? 'Initial route not found! \n did you forget to annotate your home page with @initial or @CupertinoRoute(initial:true)?'
                      : 'Route name $routeName is not found!',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              OutlinedButton.icon(
                label: const Text('Back'),
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.of(ctx).pop(),
              )
            ],
          ),
        ),
      ),
    );
