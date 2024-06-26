import 'package:ggeksynergy/pages/loginScreen/login_controller.dart';
import 'package:ggeksynergy/pages/loginScreen/widgets/login_widget.dart';
import 'package:ggeksynergy/theme/app_paddings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (controller) {
      return SafeArea(
          child: Scaffold(
        appBar: AppBar(
          title: const Text("Login"),
          centerTitle: true,
        ),
        body: Padding(
          padding: AppPadding.mainPadding,
          child: LoginScreenWidget(controller: controller),
        ),
      ));
    });
  }
}
