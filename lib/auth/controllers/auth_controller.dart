import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:so_po_dev/network/services.dart';

class AuthController extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final ApiService _apiService = ApiService();
  var isLoading = false.obs;
  var loginError = ''.obs; // Observable for error messages

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void login() async {
    if (formKey.currentState?.validate() ?? false) {
      // Handle login logic here
      try {
        isLoading(true);
        final loginResponse = await _apiService.requestLogin(usernameController.text, passwordController.text);
        // print('Login successful: $loginResponse');
        // Handle successful login here, e.g., navigate to a different screen
        loginError(''); // Reset error message
        // Get.to(HomeScreen());
      } catch (e) {
        loginError('Login failed: $e'); // Set error message
        // print('Login failed: $e');
      }finally {
        isLoading(false);
      }
    }
  }
}
