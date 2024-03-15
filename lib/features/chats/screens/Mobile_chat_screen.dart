// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dreamchat/common/config/config.dart';
import 'package:dreamchat/features/calls/controller/callController.dart';
import 'package:dreamchat/features/calls/screens/audio_call_page.dart';
import 'package:dreamchat/features/calls/screens/video_call_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:math' as math;

import 'package:dreamchat/common/widget/loader.dart';
import 'package:dreamchat/features/auth/controller/auth_controller.dart';
import 'package:dreamchat/features/chats/widgets/chatList.dart';
import 'package:dreamchat/models/user_model.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

import '../../../const.dart';
import '../widgets/bottom_chat_field.dart';

final String localUserID = math.Random().nextInt(10000).toString();

class MobileChatScreen extends ConsumerWidget {
  static const String routeName = 'mobileChatScreen';

  final String name;
  final String uid;
  MobileChatScreen({
    required this.name,
    required this.uid,
  });

  void createCall(String callerId, String reciverId, ref) {
    ref.read(callControllerProvider).createCall(
          callerId,
          reciverId,
        );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kappColor,
        title: StreamBuilder<UserModel>(
            stream: ref.read(authControllerProvider).userById(uid),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Loader();
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                  ),
                  Text(
                    snapshot.data!.isOnline ? 'online' : 'offline',
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                    ),
                  )
                ],
              );
            }),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () async {
              final String callerId = FirebaseAuth.instance.currentUser!.uid;
              createCall(
                callerId,
                uid,
                ref,
              );
              String callId = await ref
                  .read(callControllerProvider)
                  .getCallId(callerId, uid);
              // ignore: use_build_context_synchronously
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AudioCall(
                    userName: name,
                    callid: callId,
                  ),
                ),
              );
            },
            icon: const Icon(Icons.call),
          ),
          IconButton(
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CallPage(
                    userName: name,
                    callid: '',
                  ),
                ),
              );
            },
            icon: const Icon(Icons.video_call),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ChatList(
              reciverUserId: uid,
            ),
          ),
          BottomChatField(
            reciverUserId: uid,
          ),
        ],
      ),
    );
  }
}
