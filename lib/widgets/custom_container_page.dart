import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  String image;
  CustomContainer({required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        height: 250,
        width: 300,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
                image: AssetImage(image))),
        );
    }
}