import 'package:flutter/material.dart';

class WithDrawRequestScreen extends StatefulWidget {
  const WithDrawRequestScreen({super.key});

  @override
  State<WithDrawRequestScreen> createState() => _WithDrawRequestScreenState();
}

class _WithDrawRequestScreenState extends State<WithDrawRequestScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black.withOpacity(0.9),
        title: Text(
          "WithDraw Request",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
