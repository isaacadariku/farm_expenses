import 'package:stacked/stacked.dart';

class MainViewModel extends IndexTrackingViewModel {
 
   /// To move to [HomeView] when the back button is press on any other index
  onWillPop(currentIndex) {
    if (currentIndex != 0) {
      setIndex(0);
      return false;
    }
    return true;
  }
}
