import 'package:ggeksynergy/theme/app_colors.dart';
import 'package:ggeksynergy/theme/app_textstyles.dart';
import 'package:ggeksynergy/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContainerWidget {
  static Widget containerWidget({
    required String votes,
    required String url,
    required String name,
    required String genre,
    required String director,
    required String starring,
    required String views,
    required String releaseDate,
    required String votingPeople,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: AppColors.primaryBlack,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Column(
                children: [
                  const Icon(Icons.arrow_drop_up),
                  SizedBox(height: 10.h),
                  Text(votes, style: AppTextStyles.labelText),
                 const Icon(Icons.arrow_drop_down),
                  SizedBox(height: 20.h),
                 const Text("Votes", style: AppTextStyles.labelText2),
                ],
              ),
              SizedBox(width: 10.w),
              Container(
                height: 100.h,
                width: 50.w,
                child: Image.network(url, fit: BoxFit.fill),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name,
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primaryWhite)),
                    Row(
                      children: [
                        const Text("Genre: ", style: AppTextStyles.labelText3),
                        Expanded(
                            child:
                                Text(genre, style: AppTextStyles.labelText4)),
                      ],
                    ),
                    Row(
                      children: [
                        const Text("Director: ", style: AppTextStyles.labelText3),
                        Expanded(
                            child: Text(director,
                                style: AppTextStyles.labelText4)),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       const Text("Starring: ", style: AppTextStyles.labelText3),
                        Expanded(
                            child: Text(starring,
                                style: AppTextStyles.labelText4)),
                      ],
                    ),
                    Row(
                      children: [
                      const  Text("Mins | English | ",
                            style: AppTextStyles.labelText3),
                        Expanded(
                            child: Text(
                          releaseDate,
                          style: AppTextStyles.labelText4,
                          overflow: TextOverflow.ellipsis,
                        )),
                      ],
                    ),
                    Text("$views views | Voted by $votingPeople People",
                        style: AppTextStyles.labelText5),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Center(
              child: AppButton.appButton(
                  buttonText: "Watch Trailer", onPressed: () {})),
        ],
      ),
    );
  }
}
