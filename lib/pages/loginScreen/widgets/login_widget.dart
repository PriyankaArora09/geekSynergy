import 'package:ggeksynergy/navigators/navigators.dart';
import 'package:ggeksynergy/theme/app_textstyles.dart';
import 'package:ggeksynergy/widgets/app_button.dart';
import 'package:ggeksynergy/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../widgets/snackbar.dart';
import '../login_controller.dart';

class LoginScreenWidget extends StatelessWidget {
  const LoginScreenWidget({super.key, required this.controller});
  final LoginController controller;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 80.h,
        ),
        AppTextField.appTextField(
            label: "User Name",
            isNumber: true,
            controller: controller.nameController,
            validator: (value) {
              if (value!.isEmpty) {
                return "UserName can't be empty";
              }
              return null;
            },
            key: controller.mobileKey,
            onChanged: (_) {}),
        SizedBox(
          height: 40.h,
        ),
        AppTextField.appTextField(
          label: "Password",
          key: controller.passKey,
          validator: (value) {
            return controller.validatePassword(value!);
          },
          controller: controller.passController,
          onChanged: (p0) {},
        ),
        SizedBox(
          height: 80.h,
        ),
        AppButton.appButton(
            buttonText: "Login",
            onPressed: () async {
              if (controller.mobileKey.currentState!.validate() &&
                  controller.passKey.currentState!.validate()) {
                bool isValid = await controller.validateLogin(
                  controller.nameController.text,
                  controller.passController.text,
                );

                if (isValid) {
                  NavigateTo.goToHome();
                  getSnackBar("Logged in Successfully", true);
                } else {
                  getSnackBar("Invalid Credentials", false);
                }
              }
            }),
        SizedBox(
          height: 30.h,
        ),
        GestureDetector(
          onTap: () {
            NavigateTo.goToSignUp();
          },
          child: const Text.rich(TextSpan(children: [
            TextSpan(
                text: "Does not have an account?",
                style: AppTextStyles.labelText),
            TextSpan(text: " Sign Up", style: AppTextStyles.buttonText2)
          ])),
        )
      ],
    ));
  }
}
