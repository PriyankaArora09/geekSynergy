

import 'package:get/get.dart';
import 'package:ggeksynergy/pages/company%20Details/controller.dart';

class CompanyDetailsBinding extends Bindings {
  @override
  void dependencies() {
    
    Get.lazyPut(
      () => CompanyDetailsController(),
    );
  }
}
