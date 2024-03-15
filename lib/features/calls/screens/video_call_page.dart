// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

import '../../../common/config/config.dart';

final String localUserID = math.Random().nextInt(10000).toString();

class CallPage extends StatefulWidget {
  const CallPage({
    Key? key,
    required this.userName,
    required this.callid,
  }) : super(key: key);
  final String userName;
  final String callid;

  @override
  State<CallPage> createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // vgetCallId();
  }

  // void vgetCallId() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   vcallid = prefs.getString("callid");
  // }

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
      config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
        ..onOnlySelfInRoom = (context) {
          Navigator.of(context).pop();
        },
    );
  }
}
