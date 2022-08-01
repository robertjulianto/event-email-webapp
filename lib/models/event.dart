class Event {
  int? eventId;
  String? eventName;
  String? eventDateTime;

  Event({this.eventId, this.eventName, this.eventDateTime});

  Event.fromJson(Map<String, dynamic> json) {
    eventId = json['event_id'];
    eventName = json['event_name'];
    eventDateTime = json['event_date_time'];
  }

  toJson() => {
        'event_id': eventId,
        'event_name': eventName,
        'event_date_time': eventDateTime
      };
}
