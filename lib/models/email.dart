class Email {
  int? eventId;
  String? emailSubject;
  String? emailContent;
  String? timestamp;

  Email({this.eventId, this.emailSubject, this.emailContent, this.timestamp});

  Email.fromJson(Map<String, dynamic> json) {
    eventId = json['event_id'];
    emailSubject = json['email_subject'];
    emailContent = json['email_content'];
    timestamp = json['timestamp'];
  }

  toJson() => {
        'event_id': eventId,
        'email_subject': emailSubject,
        'email_content': emailContent,
        'timestamp': timestamp
      };
}
