import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart'; // For iOS widgets
import 'package:referalapp/screens/sign_in_page.dart';
import 'package:referalapp/widgets/custom_button.dart';
import 'package:referalapp/widgets/custom_text.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController referralCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double padding = screenSize.width * 0.05;
    double fontSizeTitle = screenSize.width < 600 ? 21 : 24;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(padding),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              Container(
                height: screenSize.height * 0.25,
                width: double.infinity,
                child: Image.asset("assets/images/signup.jpg", filterQuality: FilterQuality.high),
              ),
              SizedBox(height: 10),
              Text(
                "Sign Up",
                style: TextStyle(fontSize: fontSizeTitle, fontWeight: FontWeight.bold, color: Colors.indigo),
              ),
              SizedBox(height: 50),
              CustomText(controller: nameController, hintText: "Name", labelText: "Name"),

              SizedBox(height: 10),
              CustomText(controller: emailController, hintText: "Email", labelText: "Email"),
              SizedBox(height: 10),
              CustomText(
                controller: passwordController,
                hintText: "Password",
                labelText: "Password",
                obscureText: !isPasswordVisible,
                suffixIcon: IconButton(
                  icon: Icon(isPasswordVisible ? Icons.visibility_off : Icons.visibility),
                  onPressed: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                ),
              ),
              SizedBox(height: 10),
              CustomText(
                controller: confirmPasswordController,
                hintText: "Confirm Password",
                labelText: "Confirm Password",
                obscureText: !isConfirmPasswordVisible,
                suffixIcon: IconButton(
                  icon: Icon(isConfirmPasswordVisible ? Icons.visibility_off : Icons.visibility),
                  onPressed: () {
                    setState(() {
                      isConfirmPasswordVisible = !isConfirmPasswordVisible;
                    });
                  },
                ),
              ),
              SizedBox(height: 10),
              CustomText(controller: referralCodeController, hintText: "Referral code (optional)", labelText: "Referral code (optional)"),
              SizedBox(height: 10),
              Platform.isIOS
                  ? CupertinoButton(
                color: Colors.indigo,
                child: Text("CREATE ACCOUNT", style: TextStyle(color: Colors.white)),
                onPressed: _onCreateAccount,
              )
                  : InkWell(
                onTap: _onCreateAccount,
                child: Custombutton(text: "CREATE ACCOUNT"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onCreateAccount() {
    // Check if any field is empty
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      _showAlertDialog(context);
    } else if (passwordController.text != confirmPasswordController.text) {

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Passwords must match!'),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      // Proceed to SignInScreen if all checks pass
      Navigator.push(context, MaterialPageRoute(builder: (context) => SignInScreen()));
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
                child: Text('OK', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23)),
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
        );
      },
    );
  }
}
