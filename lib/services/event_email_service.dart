import 'dart:convert';

import '../models/email.dart';
import 'package:http/http.dart' as http;

import '../models/event.dart';

class EventEmailService {
  static final client = http.Client();

  static const serviceUrl = "http://localhost:5000/api";
  static var customHeader = {"content-type": "application/json"};

  static final loginServiceUri = Uri.parse('$serviceUrl/admin/login');

  static final sendEmailServiceUri = Uri.parse('$serviceUrl/email/save_emails');
  static final getUpcomingEventsServiceUri =
      Uri.parse('$serviceUrl/event/get_upcoming');

  saveEmail(Email email, String token) async {
    try {
      var body = jsonEncode(email);
      customHeader["authorization"] = 'Bearer $token';
      var response = await client.post(sendEmailServiceUri,
          headers: customHeader, body: body);

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on Exception catch (_) {
      return false;
    }
  }

  Future<List<Event>> getUpcomingEvents() async {
    try {
      var response =
          await client.post(getUpcomingEventsServiceUri, headers: customHeader);
      List<Event> upcomingEvents = [];
      if (response.statusCode == 200) {
        var events = jsonDecode(response.body)['events'];
        for (Map<String, dynamic> event in events) {
          upcomingEvents.add(Event.fromJson(event));
        }
        return upcomingEvents;
      } else {
        return [];
      }
    } on Exception catch (_) {
      return [];
    }
  }

  Future<String?> login(String username, String password) async {
    try {
      var body = jsonEncode({"username": username, "password": password});
      var response =
          await client.post(loginServiceUri, headers: customHeader, body: body);
      if (response.statusCode == 200) {
        var token = jsonDecode(response.body)['token'];
        return token;
      } else {
        return null;
      }
    } on Exception catch (_) {
      return null;
    }
  }
}
