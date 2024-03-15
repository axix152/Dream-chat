import 'package:dreamchat/common/widget/loader.dart';
import 'package:dreamchat/const.dart';
import 'package:dreamchat/features/select_Contacts/controller/select_contacts_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectContactScreen extends ConsumerWidget {
  static const String routeName = 'selectContactScreen';

  void selectContact(
      WidgetRef ref, Contact selectedContact, BuildContext context) {
    ref
        .read(selectContactControllerProvider)
        .selectContact(selectedContact, context);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Select contact',
          // style: GoogleFonts.poppins(
          //   textStyle: const TextStyle(
          //     fontSize: 16,
          //   ),
          // ),
        ),
        backgroundColor: kappColor,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: ref.watch(getContactsProvider).when(
            data: (contactList) => ListView.builder(
              itemCount: contactList.length,
              itemBuilder: (context, index) {
                final contact = contactList[index];
                return GestureDetector(
                  onTap: () => selectContact(ref, contact, context),
                  child: Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: const EdgeInsets.only(
                      top: 5,
                      left: 10,
                      right: 10,
                      bottom: 10,
                    ),
                    child: ListTile(
                      title: Text(
                        contact.displayName,
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      leading: contact.photo == null
                          ? const CircleAvatar(
                              backgroundColor: kappColor,
                              child: Icon(
                                Icons.person,
                                color: Colors.white,
                              ),
                            )
                          : CircleAvatar(
                              backgroundImage: MemoryImage(contact.photo!),
                              radius: 30,
                            ),
                    ),
                  ),
                );
              },
            ),
            error: (err, trace) {
              return Scaffold(
                body: Center(
                  child: Text(err.toString()),
                ),
              );
            },
            loading: () => const Loader(),
          ),
    );
  }
}
