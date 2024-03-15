// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dreamchat/common/enums/message_enum.dart';

class MessageModel {
  final String senderId;
  final String reciverId;
  final String text;
  final MessageEnum type;
  final DateTime sent;
  final String messageId;
  final bool isSeen;
  final String repliedMessage;
  final String repliedTo;
  final MessageEnum repliedMessageType;

  MessageModel({
    required this.senderId,
    required this.reciverId,
    required this.text,
    required this.type,
    required this.sent,
    required this.messageId,
    required this.isSeen,
    required this.repliedMessage,
    required this.repliedTo,
    required this.repliedMessageType,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'senderId': senderId,
      'reciverId': reciverId,
      'text': text,
      'type': type.type,
      'sent': sent.millisecondsSinceEpoch,
      'messageId': messageId,
      'isSeen': isSeen,
      'repliedMessage': repliedMessage,
      'repliedTo': repliedTo,
      'repliedMessageType': repliedMessageType.type,
    };
  }

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      senderId: map['senderId'] as String,
      reciverId: map['reciverId'] as String,
      text: map['text'] as String,
      type: (map['type'] as String).toEnum(),
      sent: DateTime.fromMillisecondsSinceEpoch(map['sent'] as int),
      messageId: map['messageId'] as String,
      isSeen: map['isSeen'] as bool,
      repliedMessage: map['repliedMessage'] as String,
      repliedTo: map['repliedTo'] as String,
      repliedMessageType: (map['repliedMessageType'] as String).toEnum(),
    );
  }
}
