import 'package:ggeksynergy/theme/app_textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_colors.dart';

class AppButton {
  static Widget appButton(
      {required String buttonText, required VoidCallback onPressed}) {
    return SizedBox(
      width: double.infinity,
      child: FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          textStyle: AppTextStyles.buttonText,
          backgroundColor: AppColors.primaryYellow,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.r), // border radius
          ),
        ),
        child: Text(buttonText),
      ),
    );
  }
}
