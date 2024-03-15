import 'dart:io';

import 'package:dreamchat/common/enums/message_enum.dart';
import 'package:dreamchat/common/providers/message_reply_provider.dart';
import 'package:dreamchat/features/auth/controller/auth_controller.dart';
import 'package:dreamchat/features/chats/repository/chat_repository.dart';
import 'package:dreamchat/models/chat_contact.dart';
import 'package:dreamchat/models/group_model.dart';
import 'package:dreamchat/models/message_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final chatControllerProvider = Provider((ref) {
  final chatRepository = ref.watch(chatRepositoryProvider);
  return ChatController(
    chatRepository: chatRepository,
    ref: ref,
  );
});

class ChatController {
  final ChatRepository chatRepository;
  final ProviderRef ref;

  ChatController({
    required this.chatRepository,
    required this.ref,
  });

  Stream<List<ChatContact>> chatContact() {
    return chatRepository.getChatContact();
  }

  Stream<List<Groups>> chatGroups() {
    return chatRepository.getChatGroups();
  }

  Stream<List<MessageModel>> chatStream(String reciverUserId) {
    return chatRepository.getChatStream(reciverUserId);
  }

  void sendTextMessage(
    BuildContext context,
    String text,
    String reciverUserId,
  ) {
    final messageReply = ref.read(messageReplyProvider);
    ref.read(userDataAuthProvider).whenData(
          (value) => chatRepository.sendTextMessage(
            context: context,
            text: text,
            reciverUserId: reciverUserId,
            senderUser: value!,
            messageReply: messageReply,
          ),
        );
    // ignore: deprecated_member_use
    ref.read(messageReplyProvider.state).update((state) => null);
  }

  void sendFileMessage(
    BuildContext context,
    File file,
    String reciverUserId,
    MessageEnum messageEnum,
  ) {
    final messageReply = ref.read(messageReplyProvider);
    ref.read(userDataAuthProvider).whenData(
          (value) => chatRepository.sendFileMessage(
            context: context,
            file: file,
            reciverUserId: reciverUserId,
            senderUserData: value!,
            ref: ref,
            messageEnum: messageEnum,
            messageReply: messageReply,
          ),
        );
    // ignore: deprecated_member_use
    ref.read(messageReplyProvider.state).update((state) => null);
  }

  void sendGIFMessage(
    BuildContext context,
    String gifUrl,
    String reciverUserId,
  ) {
    final messageReply = ref.read(messageReplyProvider);
    //https://giphy.com/gifs/LEGO-2K-HUB-lego-bricks-legos-53pVjB1kK3soW0UAWS
    // https://i.giphy.com/media/53pVjB1kK3soW0UAWS/200.gif
    int gifUrlPartIndex = gifUrl.lastIndexOf('-') + 1;
    String gifUrlPart = gifUrl.substring(gifUrlPartIndex);
    String newgifUrl = 'https://i.giphy.com/media/$gifUrlPart/200.gif';

    ref.read(userDataAuthProvider).whenData(
          (value) => chatRepository.sendGIFMesssage(
            context: context,
            gifUrl: newgifUrl,
            reciverUserId: reciverUserId,
            senderUser: value!,
            messageReply: messageReply,
          ),
        );
    // ignore: deprecated_member_use
    ref.read(messageReplyProvider.state).update((state) => null);
  }

  void setChatMessageSeen(
    BuildContext context,
    String reciverUserid,
    String messageId,
  ) {
    chatRepository.setChatMessageSeen(
      context,
      reciverUserid,
      messageId,
    );
  }
}
