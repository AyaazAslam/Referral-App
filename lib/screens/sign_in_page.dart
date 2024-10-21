import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart'; // For iOS widgets
import 'package:referalapp/screens/forgot_page.dart';
import 'package:referalapp/screens/home_page/bottom_nav_bar.dart';
import 'package:referalapp/screens/sign_up_page.dart';
import 'package:referalapp/widgets/custom_button.dart';
import 'package:referalapp/widgets/custom_text.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool isObscured = false;
  bool isOk = false;
  bool isLoading = false; // Loading state
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double padding = screenSize.width * 0.05;
    double fontSizeTitle = screenSize.width < 600 ? 21 : 24;
    double fontSizeText = screenSize.width < 600 ? 15 : 18;

    return Scaffold(
      body: isLoading // Show loading indicator if loading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Column(
            children: [
              SizedBox(height: 60),
              Container(
                height: screenSize.height * 0.25,
                width: double.infinity,
                child: Image.asset("assets/images/signin.jpg", filterQuality: FilterQuality.high),
              ),
              SizedBox(height: 50),
              Text(
                "Sign In",
                style: TextStyle(fontSize: fontSizeTitle, fontWeight: FontWeight.bold, color: Colors.indigo),
              ),
              SizedBox(height: 50),
              CustomText(
                controller: emailController,
                hintText: "Email/Number",
                labelText: "Email/Number",
              ),
              SizedBox(height: 20),
              CustomText(
                controller: passwordController,
                hintText: "Password",
                labelText: "Password",
                obscureText: isObscured,
                suffixIcon: IconButton(
                  icon: Icon(isObscured ? Icons.visibility_off : Icons.visibility),
                  onPressed: () {
                    setState(() {
                      isObscured = !isObscured;
                    });
                  },
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Checkbox(
                    value: isOk,
                    onChanged: (val) {
                      setState(() {
                        isOk = val!;
                      });
                    },
                  ),
                  Text("Remember Me", style: TextStyle(fontSize: fontSizeText, color: Colors.pink.withOpacity(0.7))),
                  // Spacer(),
                  // InkWell(
                  //   onTap: () {
                  //     Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotScreen()));
                  //   },
                  //   child: Text(
                  //     "Forgot Password?",
                  //     style: TextStyle(fontSize: fontSizeText, fontWeight: FontWeight.bold, color: Colors.indigo.withOpacity(0.7)),
                  //   ),
                  // ),
                ],
              ),
              SizedBox(height: 10),
              InkWell(
                onTap: () async {
                  if (emailController.text.isEmpty || passwordController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Center(
                          child: Text(
                            "Please enter credentials",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        backgroundColor: Colors.red,
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: EdgeInsets.all(16),
                        duration: Duration(seconds: 3),
                      ),
                    );
                  } else {
                    setState(() {
                      isLoading = true;
                    });
                    await Future.delayed(Duration(seconds: 2));
                    setState(() {
                      isLoading = false; // Stop loading
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BottomScreen()),
                    );
                  }
                },
                child: Platform.isIOS
                    ? CupertinoButton(
                  color: Colors.indigo,
                  child: Text('SIGN IN', style: TextStyle(color: Colors.white)),
                  onPressed: () {}, // Empty as it's handled above
                )
                    : Custombutton(text: 'SIGN IN'),
              ),
              SizedBox(height: 28),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?", style: TextStyle(fontSize: fontSizeText, fontWeight: FontWeight.bold, color: Colors.indigo)),
                  SizedBox(width: 4),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpScreen()),
                      );
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: fontSizeText,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
