import 'package:dreamchat/features/auth/controller/auth_controller.dart';
import 'package:dreamchat/common/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../../const.dart';

class NumberScreen extends ConsumerStatefulWidget {
  static const String routeName = 'NumberScreen';

  @override
  ConsumerState<NumberScreen> createState() => _NumberScreenState();
}

class _NumberScreenState extends ConsumerState<NumberScreen> {
  String phonenumber = '';
  bool isloading = false;

  void sendPhoneNumber() {
    if (phonenumber.isNotEmpty) {
      ref.read(authControllerProvider).signInWithPhone(context, phonenumber);
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kscaffoldGB,
      body: SafeArea(
        child: SingleChildScrollView(
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
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "Enter your phone number to continue, we will send you OTP to verify",
                  textAlign: TextAlign.center,
                  // style: GoogleFonts.poppins(
                  //   textStyle: const TextStyle(
                  //     fontSize: 15,
                  //   ),
                  // ),
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0xffeeeeee),
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.black.withOpacity(0.13),
                    ),
                  ),
                  child: Stack(
                    children: [
                      InternationalPhoneNumberInput(
                        onInputChanged: (value) {
                          {
                            setState(() {
                              phonenumber = value.phoneNumber!;
                            });
                          }
                        },
                        cursorColor: Colors.black,
                        formatInput: false,
                        selectorConfig: const SelectorConfig(
                          selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                        ),
                        inputDecoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.only(bottom: 15, left: 0),
                          border: InputBorder.none,
                          hintText: "Phone Number",
                          hintStyle: TextStyle(color: Colors.grey.shade500),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.09,
              ),
              Custom_button(
                  width: width,
                  height: height,
                  onpressed: sendPhoneNumber,
                  title: "Request OTP"),
            ],
          ),
        ),
      ),
    );
  }
}
