import 'package:ggeksynergy/navigators/navigators.dart';
import 'package:ggeksynergy/pages/sign_up/sign_up_controller.dart';
import 'package:ggeksynergy/theme/app_colors.dart';
import 'package:ggeksynergy/theme/app_textstyles.dart';
import 'package:ggeksynergy/widgets/app_button.dart';
import 'package:ggeksynergy/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../widgets/snackbar.dart';

class SignUpWidget extends StatelessWidget {
  const SignUpWidget({super.key, required this.controller});
  final SignUpController controller;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 40.h,
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
            key: controller.nameKey,
            onChanged: (_) {}),
        SizedBox(
          height: 30.h,
        ),
        AppTextField.appTextField(
            label: "Phone Number",
            isNumber: true,
            controller: controller.phoneController,
            validator: (value) {
              if (value!.isEmpty) {
                return "Phone no can't be empty";
              } else if (value.length > 10 || value.length < 6) {
                return "Phone no. is invalid";
              }
            },
            key: controller.mobileKey,
            onChanged: (_) {}),
        SizedBox(
          height: 30.h,
        ),
        AppTextField.appTextField(
            label: "Email",
            isNumber: true,
            controller: controller.emailController,
            validator: (value) {
              controller.validateEmail(value!);
              return null;
            },
            key: controller.emailKey,
            onChanged: (_) {}),
        SizedBox(
          height: 30.h,
        ),
        AppDropdownField<String>(
          label: "Profession",
          items: controller.professionList.map((String profession) {
            return DropdownMenuItem<String>(
              value: profession,
              child: Text(profession),
            );
          }).toList(),
          value: controller.selectedProfession.isNotEmpty
              ? controller.selectedProfession
              : null,
          onChanged: (String? newValue) {
            controller.selectedProfession = newValue!;
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Profession can't be empty";
            }
            return null;
          },
        ),
        SizedBox(
          height: 30.h,
        ),
        AppTextField.appTextField(
            label: "Password",
            isNumber: true,
            controller: controller.passController,
            validator: (value) {
              controller.validatePassword(value!);
              return null;
            },
            key: controller.passKey,
            onChanged: (_) {}),
        SizedBox(
          height: 30.h,
        ),
        AppTextField.appTextField(
          label: "Confirm Password",
          key: controller.confirmPass,
          validator: (value) {
            if (value!.isEmpty) {
              return "Field can't be empty";
            } else if (value != controller.passController.text) {
              return "Passwords do not match";
            }
            return null;
          },
          controller: controller.confirmPassController,
          onChanged: (p0) {},
        ),
        SizedBox(
          height: 80.h,
        ),
        AppButton.appButton(
            buttonText: "Sign Up",
            onPressed: () {
              if (controller.mobileKey.currentState!.validate() &&
                  controller.passKey.currentState!.validate() &&
                  controller.nameKey.currentState!.validate() &&
                  controller.emailKey.currentState!.validate() &&
                  controller.confirmPass.currentState!.validate()) {
                controller.saveUserData();
                NavigateTo.goToLogin();
                getSnackBar("Account Created Successfully", true);
              }
            }),
        SizedBox(
          height: 30.h,
        ),
        GestureDetector(
          onTap: () {
            NavigateTo.goToLogin();
          },
          child: const Text.rich(TextSpan(children: [
            TextSpan(
                text: "Already have an account?",
                style: AppTextStyles.labelText),
            TextSpan(text: " Login", style: AppTextStyles.buttonText2)
          ])),
        )
      ],
    ));
  }
}

class AppDropdownField<T> extends StatelessWidget {
  final String label;
  final List<DropdownMenuItem<T>> items;
  final T? value;
  final Function(T?) onChanged;
  final String? Function(T?)? validator;

  const AppDropdownField({
    super.key,
    required this.label,
    required this.items,
    this.value,
    required this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: key,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: DropdownButtonFormField<T>(
        value: value,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: AppTextStyles.labelText,
          contentPadding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 10.w),
          filled: true,
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.primaryYellow),
              borderRadius: BorderRadius.circular(4.r)),
          border: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors.primaryGrey,
              ),
              borderRadius: BorderRadius.circular(4.r)),
        ),
        items: items,
        onChanged: onChanged,
        validator: validator,
        style: AppTextStyles.labelText,
        icon: const Icon(
          Icons.arrow_drop_down,
          color: AppColors.primaryGrey,
        ),
      ),
    );
  }
}
