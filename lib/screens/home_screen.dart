import 'dart:io';

import 'package:dreamchat/const.dart';
import 'package:dreamchat/features/auth/controller/auth_controller.dart';
import 'package:dreamchat/features/auth/screens/number_screen.dart';
import 'package:dreamchat/features/select_Contacts/screens/select_contact_screen.dart';
import 'package:dreamchat/screens/Tab_bar_items/call_tab.dart';
import 'package:dreamchat/features/chats/screens/chat_tap.dart';
import 'package:dreamchat/features/status/screens/status_contact_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common/utils/util.dart';
import '../features/group/screens/create_group_screen.dart';
import '../features/status/screens/confirm_status_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  static const String routeName = "HomeScreen";

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with WidgetsBindingObserver, TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:
        ref.read(authControllerProvider).setUserState(true);
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.detached:
      case AppLifecycleState.paused:
        ref.read(authControllerProvider).setUserState(false);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: kappColor,
            title: const Text("Dream Chat"),
            centerTitle: false,
            actions: <Widget>[
              GestureDetector(
                onTap: () {
                  FirebaseAuth.instance.signOut().whenComplete(() {
                    Navigator.pushNamed(context, NumberScreen.routeName);
                  });
                },
                child: const Icon(
                  Icons.search,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              PopupMenuButton(
                  icon: const Icon(
                    Icons.more_vert,
                  ),
                  itemBuilder: (context) => [
                        PopupMenuItem(
                          child: const Text("Create Group"),
                          onTap: () => Future(
                            () => Navigator.pushNamed(
                              context,
                              CreateGroupScreen.routeName,
                            ),
                          ),
                        ),
                      ]),
            ],
            bottom: TabBar(
              controller: tabController,
              indicatorColor: Colors.white,
              indicatorWeight: 4,
              unselectedLabelColor: Colors.grey,
              // labelStyle: GoogleFonts.poppins(
              //   textStyle: const TextStyle(
              //     fontSize: 15,
              //   ),
              // ),
              tabs: const [
                Tab(
                  text: "Chat",
                ),
                Tab(
                  text: "Status",
                ),
              ],
            ),
          ),
          body: TabBarView(
            controller: tabController,
            children: <Widget>[
              ChatScreen(),
              const StatusTab(),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              if (tabController.index == 0) {
                Navigator.pushNamed(context, SelectContactScreen.routeName);
              } else {
                File? pickedImage = await pickImageFromGallery(context);
                if (pickedImage != null) {
                  // ignore: use_build_context_synchronously
                  Navigator.pushNamed(context, ConfirmStatus.routeName,
                      arguments: pickedImage);
                }
              }
            },
            backgroundColor: kappColor,
            elevation: 5,
            child: tabController.index == 0
                ? const Icon(Icons.comment)
                : const Icon(Icons.camera_alt),
          ),
        ),
      ),
    );
  }
}
