
import 'package:ggeksynergy/pages/sign_up/sign_up_controller.dart';
import 'package:ggeksynergy/pages/sign_up/sign_up_widget.dart';
import 'package:ggeksynergy/theme/app_paddings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(builder: (controller) {
      return SafeArea(
          child: Scaffold(
        appBar: AppBar(
          title: const Text("Sign Up"),
          centerTitle: true,
        ),
        body: Padding(
          padding: AppPadding.mainPadding,
          child: SignUpWidget(controller: controller),
        ),
      ));
    });
  }
}
