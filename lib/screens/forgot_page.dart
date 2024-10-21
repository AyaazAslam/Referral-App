import 'package:flutter/material.dart';
import 'package:referalapp/screens/home_page/otp_page.dart';
import 'package:referalapp/screens/sign_in_page.dart';
import 'package:referalapp/widgets/custom_button.dart';
import 'package:referalapp/widgets/custom_text.dart';

class ForgotScreen extends StatelessWidget {
  const ForgotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController forgotPass=TextEditingController();
    return  Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false
        ,
        leading: IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInScreen()));
        },icon:  Icon(Icons.arrow_back_ios,color: Colors.white,size: 30,weight: 33,)),
        backgroundColor: Colors.indigo.withOpacity(0.8),
        title: Text("Back",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30),
              Container(
                height: 200,
                width: double.infinity,
                child: Image.asset("assets/images/forgot.jpg", filterQuality: FilterQuality.high),
              ),

              Text("Forgot  Password",style: TextStyle(color: Colors.indigo,fontSize: 20,fontWeight: FontWeight.bold),),
              SizedBox(height: 50,),

              CustomText(
                keyboardType: TextInputType.emailAddress,
                  controller: forgotPass , hintText: "Email", labelText: "Email"),
              SizedBox(height: 20,),
            InkWell(
              onTap: () {
                if (forgotPass.text.isEmpty) {
                  _showAlertDialog(context);
                } else {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>OptScreen()));
                }
              },
              child: Custombutton(text: "SEND CODE"),
            ),

            ],
          ),
        ),
      ),
    );
  }
}


void _showAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Center(child: Text('Refer & Earn', style: TextStyle(fontWeight: FontWeight.bold))),
        content: Padding(
          padding: const EdgeInsets.only(left: 44.0),
          child: Text('Enter your email/number.', style: TextStyle()),
        ),


        actions: <Widget>[
          Center(
            child: TextButton(
              child: Text('OK', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23)),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ),
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Rounded corners
        ),
        contentPadding: EdgeInsets.all(20), // Padding around the content
        // Set minimum width and height for the alert dialog

      );
    },
  );
}
