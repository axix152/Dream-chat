import 'package:flutter/material.dart';

class Custom_button extends StatelessWidget {
  const Custom_button({
    Key? key,
    required this.width,
    required this.height,
    required this.onpressed,
    required this.title,
  }) : super(key: key);

  final double width;
  final double height;
  final VoidCallback onpressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.7,
      height: height * 0.07,
      child: ElevatedButton(
        onPressed: onpressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
            side: BorderSide(color: Colors.white),
          ),
        ),
        child: Text(
          title,
          // style: GoogleFonts.poppins(
          //   textStyle: const TextStyle(
          //     fontSize: 20,
          //     fontWeight: FontWeight.w500,
          //   ),
          // ),
        ),
      ),
    );
  }
}
