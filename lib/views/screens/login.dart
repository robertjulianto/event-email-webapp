import 'package:even_email_webapp/controllers/login_controller.dart';
import 'package:even_email_webapp/views/screens/email_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/form_input_field.dart';
import '../components/form_submit_button.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff154C79),
        body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 500),
            child: Column(children: [
              Container(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/logo.png',
                  fit: BoxFit.contain,
                  height: 280,
                  width: 280,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              FormInputField(
                labelText: "Username",
                hintText: "Enter username",
                controller: controller.usernameController,
              ),
              FormInputField(
                labelText: "Password",
                hintText: "Enter password",
                isPrivateInput: true,
                controller: controller.passwordController,
              ),
              FormSubmitButton(
                buttonText: "Login",
                onPressed: () {
                  controller.login();
                },
              ),
            ]),
          )),
        ));
  }
}
