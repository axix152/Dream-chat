import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dart:math' as math;

import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

import '../../../common/config/config.dart';

final String localUserID = math.Random().nextInt(10000).toString();

class AudioCall extends StatefulWidget {
  const AudioCall({Key? key, required this.userName, required this.callid})
      : super(key: key);
  final String userName;
  final String callid;

  @override
  State<AudioCall> createState() => _AudioCallState();
}

class _AudioCallState extends State<AudioCall> {
  @override
  Widget build(BuildContext context) {
    return ZegoUIKitPrebuiltCall(
      appID:
          appID, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
      appSign:
          appSign, // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
      userID: localUserID,
      userName: widget.userName,
      callID: widget.callid,
      // You can also use groupVideo/groupVoice/oneOnOneVoice to make more types of calls.
      config: ZegoUIKitPrebuiltCallConfig.oneOnOneVoiceCall()
        ..onOnlySelfInRoom = (context) {
          Navigator.of(context).pop();
        },
    );
  }
}
