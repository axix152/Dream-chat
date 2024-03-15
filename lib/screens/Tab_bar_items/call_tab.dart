import 'package:dreamchat/common/widget/call_list.dart';
import 'package:flutter/material.dart';

class CallTab extends StatelessWidget {
  const CallTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CallList(),
    );
    ;
  }
}
