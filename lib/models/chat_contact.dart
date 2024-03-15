class ChatContact {
  final String name;
  final String profilepic;
  final String contactId;
  final DateTime timesend;
  final String lastmessage;

  ChatContact({
    required this.name,
    required this.profilepic,
    required this.contactId,
    required this.timesend,
    required this.lastmessage,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'profilepic': profilepic,
      'contactId': contactId,
      'timesend': timesend.millisecondsSinceEpoch,
      'lastmessage': lastmessage,
    };
  }

  factory ChatContact.fromMap(Map<String, dynamic> map) {
    return ChatContact(
      name: map['name'] ?? '',
      profilepic: map['profilepic'] ?? '',
      contactId: map['contactId'] ?? '',
      timesend: DateTime.fromMillisecondsSinceEpoch(map['timesend']),
      lastmessage: map['lastmessage'] ?? '',
    );
  }
}
