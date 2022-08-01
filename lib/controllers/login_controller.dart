import 'package:even_email_webapp/views/screens/email_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/event_email_service.dart';

class LoginController extends GetxController {
  late TextEditingController usernameController;
  late TextEditingController passwordController;

  late EventEmailService service;

  RxString token = "".obs;

  @override
  void onInit() async {
    super.onInit();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    service = EventEmailService();
  }

  @override
  void onClose() {
    super.onClose();

    usernameController.dispose();
    passwordController.dispose();
  }

  void login() {
    service
        .login(usernameController.text, passwordController.text)
        .then((value) => {
              Get.to(EmailScreen(
                token: value!,
              ))
            });
  }
}
