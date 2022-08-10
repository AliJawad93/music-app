import 'package:get/get.dart';

class BottomNavigationBarController extends GetxController {
  int _currentIndex = 0;

  void setCurrentIndex(int index) {
    _currentIndex = index;
    update();
  }

  get getCurrentIndex => _currentIndex;
}
