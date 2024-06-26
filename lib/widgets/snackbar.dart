import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

getSnackBar(String mssg, bool isSuccess) {
  return Get.showSnackbar(GetSnackBar(
    snackPosition: SnackPosition.TOP,
    message: mssg,
    duration: Duration(seconds: 2),
    backgroundColor: (isSuccess) ? Colors.green : Colors.red,
  ));
}
