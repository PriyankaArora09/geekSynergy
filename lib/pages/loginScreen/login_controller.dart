import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  GlobalKey<FormState> mobileKey = GlobalKey<FormState>();
  GlobalKey<FormState> passKey = GlobalKey<FormState>();

  String? validatePassword(String value) {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (value.isEmpty) {
      return 'Please enter password';
    } else {
      if (!regex.hasMatch(value)) {
        return 'Enter valid password';
      } else {
        return null;
      }
    }
  }

  Future<Map<String, String>> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? name = prefs.getString('name');
    String? password = prefs.getString('password');
    return {
      'name': name ?? '',
      'password': password ?? '',
    };
  }

  Future<bool> validateLogin(String inputName, String inputPassword) async {
    Map<String, String> userData = await getUserData();
    print(userData);
    return inputName == userData['name'] &&
        inputPassword == userData['password'];
  }
}
