
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void login() {
    if (formKey.currentState?.validate() ?? false) {
      // Handle login logic here
      // print('Username: ${usernameController.text}');
      // print('Password: ${passwordController.text}');
    }
  }
}