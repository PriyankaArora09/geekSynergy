import 'package:ggeksynergy/pages/company%20Details/controller.dart';
import 'package:ggeksynergy/pages/company%20Details/widget.dart';

import 'package:ggeksynergy/theme/app_paddings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompanyDetails extends StatelessWidget {
  const CompanyDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CompanyDetailsController());
    return GetBuilder<CompanyDetailsController>(builder: (controller) {
      return SafeArea(
          child: Scaffold(
        appBar: AppBar(
          title: const Text("Company Details"),
          centerTitle: true,
        ),
        body: Padding(
          padding: AppPadding.mainPadding,
          child: CompanyDetailsWidget(controller: controller),
        ),
      ));
    });
  }
}
