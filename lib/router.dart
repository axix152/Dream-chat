import 'dart:io';

import 'package:dreamchat/features/select_Contacts/screens/select_contact_screen.dart';
import 'package:dreamchat/features/chats/screens/Mobile_chat_screen.dart';
import 'package:dreamchat/features/status/screens/status_screen.dart';
import 'package:dreamchat/models/status_model.dart';
import 'package:dreamchat/screens/home_screen.dart';
import 'package:dreamchat/features/auth/screens/login_Screen.dart';
import 'package:dreamchat/features/auth/screens/number_screen.dart';
import 'package:dreamchat/features/auth/screens/opt_screen.dart';
import 'package:dreamchat/screens/splash_Screen.dart';
import 'package:dreamchat/screens/userInfoScreen.dart';
import 'package:flutter/material.dart';

import 'features/group/screens/create_group_screen.dart';
import 'features/status/screens/confirm_status_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // ignore: unused_local_variable
    final args = settings.arguments;

    switch (settings.name) {
      case SplashScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case LoginScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => LoginScreen(),
        );
      case OTPScreen.routeName:
        final verificationId = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => OTPScreen(
            verificationId: verificationId,
          ),
        );
      case NumberScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => NumberScreen(),
        );

      case HomeScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => HomeScreen(),
        );

      case UserInfoScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => UserInfoScreen(),
        );
      case SelectContactScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => SelectContactScreen(),
        );
      case MobileChatScreen.routeName:
        final argumnets = settings.arguments as Map<String, dynamic>;
        final name = argumnets['name'];
        final uid = argumnets['uid'];
        //final profilePic = argumnets['profilePic'];
        return MaterialPageRoute(
          builder: (context) => MobileChatScreen(
            name: name,
            uid: uid,
          ),
        );
      case StatusScreen.routeName:
        final status = settings.arguments as Status;
        return MaterialPageRoute(
          builder: (context) => StatusScreen(
            status: status,
          ),
        );
      case ConfirmStatus.routeName:
        final file = settings.arguments as File;
        return MaterialPageRoute(
          builder: (context) => ConfirmStatus(
            file: file,
          ),
        );

      case CreateGroupScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const CreateGroupScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text("This page doesn\'t exist"),
            ),
          ),
        );
    }
  }
}
