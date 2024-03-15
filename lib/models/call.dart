// ignore_for_file: public_member_api_docs, sort_constructors_first
class CallModel {
  final String callerId;
  final String callId;
  final String receiverId;
  final DateTime dateTime;
  CallModel({
    required this.callerId,
    required this.callId,
    required this.receiverId,
    required this.dateTime,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'callerId': callerId,
      'callId': callId,
      'receiverId': receiverId,
      'dateTime': dateTime.millisecondsSinceEpoch,
    };
  }

  factory CallModel.fromMap(Map<String, dynamic> map) {
    return CallModel(
      callerId: map['callerId'] as String,
      callId: map['callId'] as String,
      receiverId: map['receiverId'] as String,
      dateTime: DateTime.fromMillisecondsSinceEpoch(map['dateTime'] as int),
    );
  }
}
