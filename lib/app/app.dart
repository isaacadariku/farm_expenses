import 'package:stacked/stacked_annotations.dart';
import '../ui/views/startup/startup_view.dart';
import '../ui/views/main/main_view.dart';

@StackedApp(routes: [
  MaterialRoute(page: StartUpView, initial: true),
  MaterialRoute(page: MainView),
], dependencies: [])
class AppSetup {
  /** Serves no purpose besides having an annotation attached to it */
}
