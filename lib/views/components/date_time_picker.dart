import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../controllers/email_controller.dart';

class CustomeDateTimePicker extends StatelessWidget {
  final emailController = Get.put(EmailController());
  final formatter = NumberFormat('00');
  final double iconSize = 40;

  CustomeDateTimePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            children: [
              const Text("Send on",
                  style: TextStyle(fontSize: 20, color: Colors.white)),
              const SizedBox(
                width: 30,
              ),
              Obx(
                () => Text(
                  DateFormat("dd-MM-yyyy")
                      .format(emailController.selectedDate.value)
                      .toString(),
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              IconButton(
                onPressed: (() => emailController.chooseDate()),
                icon: const Icon(Icons.calendar_today),
                iconSize: iconSize,
                color: Colors.white,
                hoverColor: Colors.blue,
              ),
            ],
          ),
          Row(
            children: [
              const Text("at",
                  style: TextStyle(fontSize: 20, color: Colors.white)),
              const SizedBox(
                width: 30,
              ),
              Obx(
                () => Text(
                  '${formatter.format(emailController.selectedTime.value.hour)}:${formatter.format(emailController.selectedTime.value.minute)} GMT+7',
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              IconButton(
                onPressed: (() => emailController.chooseTime()),
                icon: const Icon(Icons.timer),
                iconSize: iconSize,
                color: Colors.white,
                hoverColor: Colors.blue,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
