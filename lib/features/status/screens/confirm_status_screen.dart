// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:dreamchat/const.dart';
import 'package:dreamchat/features/status/controller/status_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConfirmStatus extends ConsumerWidget {
  static const String routeName = '/confirm-status-screen';
  final File file;
  const ConfirmStatus({
    required this.file,
  });

  void addStatus(WidgetRef ref, BuildContext context) {
    ref.read(StatusControllerProvider).addStatus(file, context);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: Image.file(file),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => addStatus(ref, context),
        backgroundColor: kappColor,
        child: const Icon(
          Icons.done,
          color: Colors.white,
        ),
      ),
    );
  }
}
