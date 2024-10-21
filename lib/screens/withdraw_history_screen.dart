import 'package:flutter/material.dart';

class WithDrawHistoryScreen extends StatefulWidget {
  const WithDrawHistoryScreen({super.key});

  @override
  State<WithDrawHistoryScreen> createState() => _WithDrawHistoryScreenState();
}

class _WithDrawHistoryScreenState extends State<WithDrawHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black.withOpacity(0.9),
        title: Text(
          "Earnings",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
