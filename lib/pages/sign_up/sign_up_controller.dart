import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  GlobalKey<FormState> mobileKey = GlobalKey<FormState>();
  GlobalKey<FormState> passKey = GlobalKey<FormState>();
  GlobalKey<FormState> nameKey = GlobalKey<FormState>();
  GlobalKey<FormState> emailKey = GlobalKey<FormState>();
  GlobalKey<FormState> confirmPass = GlobalKey<FormState>();

  String selectedProfession = '';
  final List<String> professionList = [
    'Doctor',
    'Nurse',
    'Pharmacist',
    'Technician',
    'Engineer',
    'Musician'
  ];

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

  String? validateEmail(String value) {
    const pattern = r"(^[6-9]\d{9}$)";
    RegExp regex = RegExp(pattern);
    if (value.isEmpty) {
      return 'Please enter mobile number';
    } else {
      if (!regex.hasMatch(value)) {
        return 'Enter valid number';
      } else {
        return null;
      }
    }
  }

  Future<void> saveUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', nameController.text);
    await prefs.setString('phone', phoneController.text);
    await prefs.setString('email', emailController.text);
    await prefs.setString('password', passController.text);
    await prefs.setString('profession', selectedProfession);
    print("saved");
  }
}
