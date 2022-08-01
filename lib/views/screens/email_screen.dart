import 'package:even_email_webapp/controllers/email_controller.dart';
import 'package:even_email_webapp/views/components/form_input_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pop_alert/pop_alert.dart';

import '../components/date_time_picker.dart';
import '../components/form_drop_down.dart';
import '../components/form_submit_button.dart';

class EmailScreen extends StatelessWidget {
  final String token;
  EmailScreen({super.key, required this.token});

  final emailController = Get.put(EmailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff154C79),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 500),
            child: GetBuilder<EmailController>(builder: (controller) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 30),
                    alignment: Alignment.center,
                    child: const Text(
                      'Create Email',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Obx(() => FormDropDown(
                      items: controller.upcomingEvents
                          .map((e) => DropdownMenuItem(
                              value: e.eventId.toString(),
                              child: Text(
                                e.eventName!,
                                style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    decorationColor: Color(0xff154C79)),
                              )))
                          .toList(),
                      value: controller.selectedEventId.value.toString(),
                      onChanged: (value) {
                        controller
                            .setSelectedEventId(int.parse(value.toString()));
                      })),
                  FormInputField(
                    labelText: "Subject",
                    hintText: "Enter email subject",
                    controller: controller.subjectController,
                  ),
                  FormInputField(
                    labelText: "Content",
                    hintText: "Enter email content",
                    isSingleLine: true,
                    controller: controller.contentController,
                  ),
                  CustomeDateTimePicker(),
                  FormSubmitButton(
                      buttonText: "Save email",
                      onPressed: () {
                        controller.saveEmail(token).then((value) {
                          if (value) {
                            PopAlert.iconAlert(
                              context: context,
                              icon: PopAlertIcon.success,
                              title: 'Create scheduled email is success!',
                              button: 'OK',
                            );
                          } else {
                            PopAlert.iconAlert(
                              context: context,
                              icon: PopAlertIcon.failed,
                              title: 'Fail to create scheduled email!',
                              button: 'OK',
                            );
                          }
                        });
                      }),
                ],
              );
            })),
      )),
    );
  }
}
