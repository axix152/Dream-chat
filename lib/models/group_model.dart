class Groups {
  final String senderId;
  final String name;
  final String groupId;
  final DateTime timeSent;
  final String lastMessage;
  final String groupPic;
  final List<String> membersUid;

  Groups({
    required this.senderId,
    required this.name,
    required this.groupId,
    required this.lastMessage,
    required this.groupPic,
    required this.membersUid,
    required this.timeSent,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'senderId': senderId,
      'name': name,
      'groupId': groupId,
      'lastMessage': lastMessage,
      'groupPic': groupPic,
      'membersUid': membersUid,
      'timeSent': timeSent.millisecondsSinceEpoch,
    };
  }

  factory Groups.fromMap(Map<String, dynamic> map) {
    return Groups(
      senderId: map['senderId'] as String,
      name: map['name'] as String,
      groupId: map['groupId'] as String,
      timeSent: DateTime.fromMillisecondsSinceEpoch(map['timeSent'] as int),
      lastMessage: map['lastMessage'] as String,
      groupPic: map['groupPic'] as String,
      membersUid: List<String>.from(
        (map['membersUid'] as List<String>),
      ),
    );
  }
}
