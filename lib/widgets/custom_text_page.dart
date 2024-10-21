import 'package:flutter/material.dart';

class CustomTextmain extends StatelessWidget {
  String text;
  CustomTextmain({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: 11),
        );
    }
}