import 'package:flutter/material.dart';
import 'package:referalapp/screens/withDraw_request_page.dart';
import 'package:referalapp/screens/withdraw_history_screen.dart';

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>WithDrawHistoryScreen()));
              },
              child: _buildGradientButton("Withdraw History")),
          SizedBox(height: 36), // Space between buttons
          InkWell(
             onTap: (){
               Navigator.push(context, MaterialPageRoute(builder: (context)=>WithDrawRequestScreen()));
             },
              child: _buildGradientButton("Withdraw Request")),
        ],
      ),
    );
  }

  Widget _buildGradientButton(String text) {
    return Container(
      width: 200, // Set a width for the button
      height: 50, // Set a height for the button
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.purple, Colors.white],
        ),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.purple.withOpacity(0.5),
            blurRadius: 10,
            offset: Offset(0, 5), // Shadow position
          ),
        ],
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
