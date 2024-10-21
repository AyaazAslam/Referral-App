import 'package:flutter/material.dart';
import 'package:referalapp/screens/sign_in_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  navigation() {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => SignInScreen()));
    }
    );
  }

  @override
  void initState() {
    super.initState();
    navigation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.purple.withOpacity(0.6),
              Colors.white.withOpacity(0.5),

              Colors.purple.withOpacity(0.3),

            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  height: 150,
                  width: 150,
                  child: Image.asset(
                    "assets/images/dollor.jpg",
                    fit: BoxFit.cover, // Ensure the image covers the container
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
