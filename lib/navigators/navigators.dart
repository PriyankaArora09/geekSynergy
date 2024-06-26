import 'package:get/get.dart';

import 'app_pages.dart';

///These function are used to navigate pages.
abstract class NavigateTo {
  static void goToHome() {
    Get.offAllNamed(Routes.home);
  }

  static void goToLogin() {
    Get.offAllNamed(Routes.login);
  }

  static void goToSignUp() {
    Get.offAllNamed(Routes.signUp);
  }
}
