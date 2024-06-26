import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'navigators/app_pages.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await Hive.initFlutter();
    await Hive.openBox<dynamic>('hiveBox');
    await initServices();
    runApp(const MyApp());
  } catch (exception) {}
}

Future<void> initServices() async {}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width; // Gives the width
    double height = MediaQuery.of(context).size.height; // Gives the height
    return ScreenUtilInit(
      designSize: Size(width, height),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          scrollBehavior: MyBehavior(),
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark(),
          themeMode: ThemeMode.dark,
          getPages: AppPages.pages,
          initialRoute: AppPages.initial,
        );
      },
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

