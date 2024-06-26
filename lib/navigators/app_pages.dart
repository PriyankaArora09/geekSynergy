
import 'package:get/get.dart';
import 'package:ggeksynergy/pages/homeScreen/homescreen_binding.dart';
import 'package:ggeksynergy/pages/homeScreen/homescreen_view.dart';
import 'package:ggeksynergy/pages/loginScreen/login_binding.dart';
import 'package:ggeksynergy/pages/loginScreen/login_view.dart';
import 'package:ggeksynergy/pages/sign_up/sign_up_binding.dart';
import 'package:ggeksynergy/pages/sign_up/sign_up_view.dart';



part 'app_routes.dart';

class AppPages {
  static var fadeTransitionDuration = const Duration(milliseconds: 350);
  static var cupertinoTransitionDuration = const Duration(milliseconds: 400);

  static const initial = Routes.login;

  static final pages = [
   
    GetPage<HomeScreen>(
      name: Routes.home,
      page: HomeScreen.new,
      transition: Transition.fadeIn,
      binding: HomeBinding(),
    ),
    GetPage<LoginScreen>(
        name: Routes.login,
        page: LoginScreen.new,
        transition: Transition.fadeIn,
        binding: LoginBinding(),
        transitionDuration: fadeTransitionDuration),
        GetPage<SignUpView>(
        name: Routes.signUp,
        page: SignUpView.new,
        transition: Transition.fadeIn,
        binding: SignUpBinding(),
        transitionDuration: fadeTransitionDuration),
  ];
}
