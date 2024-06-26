import 'package:ggeksynergy/pages/company%20Details/controller.dart';

import 'package:ggeksynergy/theme/app_textstyles.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CompanyDetailsWidget extends StatelessWidget {
  const CompanyDetailsWidget({super.key, required this.controller});
  final CompanyDetailsController controller;
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(TextSpan(children: [
          TextSpan(text: "Company: ", style: AppTextStyles.labelText),
          TextSpan(
              text: "Geeksynergy Technologies Pvt Ltd",
              style: AppTextStyles.labelText2)
        ])),
        Text.rich(TextSpan(children: [
          TextSpan(text: "Address: ", style: AppTextStyles.labelText),
          TextSpan(
              text: "Sanjayanagar, Bengaluru-56",
              style: AppTextStyles.labelText2)
        ])),
        Text.rich(TextSpan(children: [
          TextSpan(text: "Phone:", style: AppTextStyles.labelText),
          TextSpan(text: " XXXXXXXXX09", style: AppTextStyles.labelText2)
        ])),
        Text.rich(TextSpan(children: [
          TextSpan(text: "Email: ", style: AppTextStyles.labelText),
          TextSpan(text: "XXXXXX@gmail.com", style: AppTextStyles.labelText2)
        ])),
      ],
    ));
  }
}
