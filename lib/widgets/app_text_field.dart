import 'package:ggeksynergy/theme/app_colors.dart';
import 'package:ggeksynergy/theme/app_textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextField {
  static Widget appTextField({
    bool? isNumber = false,
    String? Function(String?)? validator,
    required TextEditingController controller,
    required Function(String)? onChanged,
    String? hintText,
    required String label,
    required GlobalKey<FormState>? key,
  }) {
    return Form(
      key: key,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: TextFormField(
        cursorOpacityAnimates: false,
        // keyboardType: (isNumber!) ? TextInputType.number : null,
        style: AppTextStyles.labelText,
        cursorHeight: 20.h,
        textAlignVertical: TextAlignVertical.top,
        showCursor: true,
        controller: controller,
        onChanged: onChanged,
        validator: validator,
        decoration: InputDecoration(
            label: Text(
              label,
              style: AppTextStyles.labelText,
            ),
            contentPadding:
                EdgeInsets.symmetric(vertical: 0.h, horizontal: 10.w),
            filled: true,
            hintText: hintText,
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.primaryYellow),
                borderRadius: BorderRadius.circular(4.r)),
            border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.primaryGrey,
                ),
                borderRadius: BorderRadius.circular(4.r))),
      ),
    );
  }
}
