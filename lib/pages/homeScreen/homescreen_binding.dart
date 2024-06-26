
import 'package:get/get.dart';

import 'homescreen_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
  
    Get.lazyPut(
      () => HomeController(),
    );
  }
}
