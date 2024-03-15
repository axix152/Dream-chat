import 'package:dreamchat/const.dart';
import 'package:dreamchat/features/auth/screens/number_screen.dart';
import 'package:flutter/material.dart';

import '../../../common/widget/custom_button.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "loginScreen";

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kscaffoldGB,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: height * 0.43,
              width: double.infinity,
              child: Image.asset(
                'assets/bg_logo.png',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: height * 0.09,
            ),
            Text(
              "Welcome to Vconnect",
              // style: GoogleFonts.poppins(
              //   textStyle: const TextStyle(
              //     fontSize: 28,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
            ),
            SizedBox(
              height: height * 0.15,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "Read our Privacy Policy. Tap Continue to accept the Term of Service",
                textAlign: TextAlign.center,
                // style: GoogleFonts.poppins(
                //   textStyle: const TextStyle(
                //     fontSize: 15,
                //   ),
                // ),
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Custom_button(
                width: width,
                height: height,
                onpressed: () {
                  Navigator.pushNamed(context, NumberScreen.routeName);
                },
                title: "Continue")
          ],
        ),
      ),
    );
  }
}
