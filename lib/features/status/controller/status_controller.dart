// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:dreamchat/features/auth/controller/auth_controller.dart';
import 'package:dreamchat/models/status_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:dreamchat/features/status/repository/status_repository.dart';

// ignore: non_constant_identifier_names
final StatusControllerProvider = Provider((ref) {
  final statusRepositiory = ref.read(statusRepositioryProvider);
  return StatusController(
    statusRepositiory: statusRepositiory,
    ref: ref,
  );
});

class StatusController {
  final StatusRepositiory statusRepositiory;
  final ProviderRef ref;
  StatusController({
    required this.statusRepositiory,
    required this.ref,
  });

  void addStatus(
    File file,
    BuildContext context,
  ) {
    ref.watch(userDataAuthProvider).whenData((value) {
      statusRepositiory.uploadStatus(
        userName: value!.name,
        profilePic: value.profilePic,
        phoneNumber: value.phoneNumber,
        statusImage: file,
        context: context,
      );
    });
  }

  Future<List<Status>> getStatus(BuildContext context) async {
    List<Status> statuses = await statusRepositiory.getStatus(context);
    return statuses;
  }
}
