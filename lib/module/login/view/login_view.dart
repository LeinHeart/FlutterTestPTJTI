import 'package:flutter/material.dart';
import 'package:flutter_test_pt_jelajah_teknologi_negeri/global/widgets/text_field.dart';
import '../controller/login_controller.dart';
import 'package:flutter_test_pt_jelajah_teknologi_negeri/core.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (controller) {
        controller.view = this;

        return GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
            appBar: AppBar(title: const Text("Login")),
            body: Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // --- Email Textfield
                  CustomTextField(
                    controller: controller.emailTxtCtrl,
                    keyboardType: TextInputType.emailAddress,
                    hintText: "a@a.com",
                    labelText: "Email",
                    prefixIcon: Icons.email,
                  ),
                  const SizedBox(height: 24.0),

                  // --- Password Textfield
                  CustomTextField(
                    obscureText: true,
                    controller: controller.pswdTxtCtrl,
                    keyboardType: TextInputType.emailAddress,
                    hintText: "Input your Password",
                    labelText: "Password",
                    prefixIcon: Icons.email,
                  ),
                  const SizedBox(height: 24.0),

                  // --- Login Button
                  SizedBox(
                    width: Get.width,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[900],
                      ),
                      onPressed: controller.onLogin,
                      child: const Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
