// ignore_for_file: invalid_use_of_protected_member

import 'package:even_email_webapp/models/email.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instant/instant.dart';

import '../models/event.dart';
import '../services/event_email_service.dart';

class EmailController extends GetxController {
  late TextEditingController eventController;
  late TextEditingController subjectController;
  late TextEditingController contentController;
  late TextEditingController datetimeController;

  late EventEmailService service;

  DateTime singaporeDateTime = curDateTimeByZone(zone: "CST");

  var selectedDate = DateTime.now().obs;
  var selectedTime = TimeOfDay.now().obs;

  var selectedEventId = 1.obs;
  RxList<Event> upcomingEvents = <Event>[].obs;

  @override
  void onInit() async {
    super.onInit();
    subjectController = TextEditingController();
    contentController = TextEditingController();
    service = EventEmailService();
  }

  @override
  void onClose() {
    super.onClose();

    eventController.dispose();
    subjectController.dispose();
    contentController.dispose();
    datetimeController.dispose();
  }

  @override
  void onReady() {
    super.onReady();
    getUpcomingEvent();
  }

  Future<bool> saveEmail(String token) async {
    var email = Email(
        eventId: selectedEventId.value,
        emailSubject: subjectController.text,
        emailContent: contentController.text,
        timestamp: __constructDateTime());
    return await service.saveEmail(email, token);
  }

  __constructDateTime() {
    var dateTime = DateTime(
      selectedDate.value.year,
      selectedDate.value.month,
      selectedDate.value.day,
      selectedTime.value.hour,
      selectedTime.value.minute,
    );
    var dateTimeGMT8 = dateTimeToZone(zone: "CST", datetime: dateTime);
    var date = formatDate(date: dateTimeGMT8, format: "YYYYMMDD", divider: "-");
    var time = formatTime(time: dateTimeGMT8);
    return '${date}T$time+0800';
  }

  chooseDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: selectedDate.value,
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    );
    if (pickedDate != null && pickedDate != selectedDate.value) {
      selectedDate.value = pickedDate;
    }
  }

  chooseTime() async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: Get.context!,
      initialTime: selectedTime.value,
      initialEntryMode: TimePickerEntryMode.input,
    );
    if (pickedTime != null && pickedTime != selectedTime.value) {
      selectedTime.value = pickedTime;
    }
  }

  setSelectedEventId(int id) {
    selectedEventId.value = id;
  }

  getUpcomingEvent() {
    service.getUpcomingEvents().then((result) => upcomingEvents.value = result);
  }
}
