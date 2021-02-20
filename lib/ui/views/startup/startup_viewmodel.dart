import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/locator.dart';
import '../../../app/router.dart';

///
class StartupViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  ///
  Future<dynamic> setup() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 1000));

    await _navigationService.replaceWith(Routes.mainViewRoute);
  }
}
