import 'package:flutter/material.dart';

import '../../widgets/otp_widget.dart';
import '../sign_in_page.dart';

class OptScreen extends StatefulWidget {
  const OptScreen({super.key});

  @override
  State<OptScreen> createState() => _OptScreenState();
}

class _OptScreenState extends State<OptScreen> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();

  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusNode focusNode3 = FocusNode();
  FocusNode focusNode4 = FocusNode();

  @override
  void initState() {
    super.initState();
    controller1.addListener(() => _onTextChange(controller1, focusNode1, focusNode2));
    controller2.addListener(() => _onTextChange(controller2, focusNode2, focusNode3));
    controller3.addListener(() => _onTextChange(controller3, focusNode3, focusNode4));
    controller4.addListener(() => _onTextChange(controller4, focusNode4, null));
  }

  void _onTextChange(TextEditingController controller, FocusNode currentFocus, FocusNode? nextFocus) {
    if (controller.text.length == 1) {
      nextFocus?.requestFocus(); // Move to the next field if filled
    }
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    controller4.dispose();
    focusNode1.dispose();
    focusNode2.dispose();
    focusNode3.dispose();
    focusNode4.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var heightSize = MediaQuery.of(context).size.height;
    var widthSize = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 236, 237, 238),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => SignInScreen()));
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 30),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 80, 45, 140),
        title: Text('Back', style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: heightSize / 4,
                width: widthSize / 0.7,
                child: Image.asset(
                  'assets/images/otp.jpg',
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                ),
              ),
              SizedBox(height: 15),
              Text('Verification', style: TextStyle(color: Color.fromARGB(255, 80, 45, 140), fontSize: 18)),
              SizedBox(height: 10),
              Text('Check your mail', style: TextStyle(color: Colors.black45)),
              SizedBox(height: 10),
              Text('Enter your OTP number', style: TextStyle(color: Colors.black54)),
              SizedBox(height: 20),
              Container(
                height: heightSize / 4,
                width: widthSize * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        OtpTextfield(controller: controller1, focusNode: focusNode1),
                        OtpTextfield(controller: controller2, focusNode: focusNode2),
                        OtpTextfield(controller: controller3, focusNode: focusNode3),
                        OtpTextfield(controller: controller4, focusNode: focusNode4),
                      ],
                    ),
                    SizedBox(height: 25),
                    Container(
                      margin: EdgeInsets.all(10),
                      height: heightSize * 0.06,
                      width: widthSize,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color.fromARGB(255, 80, 45, 140),
                      ),
                      child: Center(
                        child: Text('Verify', style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text('Did you not receive any code?', style: TextStyle(color: Colors.black38)),
              TextButton(
                onPressed: () {},
                child: Text('RESEND NEW CODE', style: TextStyle(color: const Color.fromARGB(255, 59, 80, 197))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
