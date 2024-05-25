import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:so_po_dev/auth/controllers/auth_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final AuthController authController = Get.put(AuthController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Login'),
      // ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Icon(
                  Icons.abc,
                  size: 200,
                ),
                Form(
                  key: authController.formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextFormField(
                        controller: authController.usernameController,
                        decoration: const InputDecoration(labelText: 'Username'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your username';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: authController.passwordController,
                        decoration: const InputDecoration(labelText: 'Password',),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      Obx(() {
                        if (authController.isLoading.value) {
                          return const CircularProgressIndicator();
                        } else {
                          return ElevatedButton(
                            onPressed: authController.login,
                            child: const Text('Login'),
                          );
                        }
                      }),
                      const SizedBox(height: 20),
                      Obx(() {
                        if (authController.loginError.isNotEmpty) {
                          return Text(
                            authController.loginError.value,
                            style: const TextStyle(color: Colors.red),
                          );
                        } else {
                          return Container();
                        }
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
