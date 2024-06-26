import 'package:ggeksynergy/pages/company%20Details/view.dart';
import 'package:ggeksynergy/theme/app_colors.dart';
import 'package:ggeksynergy/theme/app_textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../theme/app_paddings.dart';
import 'homescreen_controller.dart';
import 'widgets/homescreen_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return SafeArea(
          child: Scaffold(
        backgroundColor: AppColors.primaryWhite,
        appBar: AppBar(
          title: Text("Home Page"),
          centerTitle: true,
        ),
        body: Padding(
          padding: AppPadding.mainPadding,
          child: HomeScreenWidget(controller: controller),
        ),
        drawer: Container(
          color: AppColors.primaryBlack,
          width: 250.w,
          height: double.maxFinite,
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              Text(
                "GeekSynergy",
                style: AppTextStyles.headingText,
              ),
              Divider(
                color: Colors.white,
              ),
              ListTile(
                onTap: () {
                  Get.to(const CompanyDetails());
                },
                title: Text(
                  "Company Info",
                  style: AppTextStyles.labelText,
                ),
                trailing: Icon(Icons.arrow_forward),
              )
            ],
          ),
        ),
      ));
    });
  }
}
