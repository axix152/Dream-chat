import 'package:dreamchat/const.dart';
import 'package:dreamchat/features/chats/widgets/contactList.dart';
import 'package:dreamchat/features/select_Contacts/screens/select_contact_screen.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const ContactsList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, SelectContactScreen.routeName);
        },
        backgroundColor: kappColor,
        child: const Icon(Icons.chat),
      ),
    );
  }
}
