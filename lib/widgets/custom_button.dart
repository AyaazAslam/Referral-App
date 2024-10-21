import 'package:flutter/material.dart';

class Custombutton extends StatelessWidget {
  final String text;
  const Custombutton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2), // Shadow color
              spreadRadius: 1, // Spread of the shadow
              blurRadius: 5, // Blur effect
              offset: Offset(0, 3), // Position of the shadow
            ),
          ],
        color: Colors.indigo,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Center(child: Text(text,style: TextStyle(
        color: Colors.white,fontWeight: FontWeight.bold
      ),))
    );
  }
}
