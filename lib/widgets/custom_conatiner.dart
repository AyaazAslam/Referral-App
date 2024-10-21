import 'package:flutter/material.dart';

class CustomListile extends StatelessWidget {
  String name;
  String image;
  String text1;

  CustomListile({required this.name, required this.image, required this.text1});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        tileColor: Colors.white,
        leading: Image.asset(image),
        title: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(
            text1,
            style: TextStyle(color: Color.fromARGB(255, 26, 36, 86)),
            ));
    }
}