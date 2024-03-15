// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:dreamchat/features/group/repository/group_repositiory.dart';

final groupControllerProvider = Provider((ref) {
  final groupRepositiory = ref.read(groupRepositioryProvider);
  return GroupController(
    groupRepositiory: groupRepositiory,
    ref: ref,
  );
});

class GroupController {
  final GroupRepositiory groupRepositiory;
  final ProviderRef ref;
  GroupController({
    required this.groupRepositiory,
    required this.ref,
  });

  void createGroup(BuildContext context, String name, File profilePic,
      List<Contact> selectedContact) {
    groupRepositiory.createGroup(
      context,
      name,
      profilePic,
      selectedContact,
    );
  }
}
