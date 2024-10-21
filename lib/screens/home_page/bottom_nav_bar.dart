import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:referalapp/screens/profile_page.dart';
import 'package:referalapp/screens/task_page.dart';
import 'package:referalapp/screens/wallet_page.dart';

import 'home_screen.dart';
import '../ledger_page.dart';



class BottomScreen extends StatefulWidget {
  const BottomScreen({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<BottomScreen> {
  var currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const LedgerScreen(),
    const WalletScreen(),
    const TaskScreen(),

    const ProfilePage()


  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          _screens.elementAt(currentIndex),
          Positioned(
            bottom: 0,
            left: 20,
            right: 20,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Container(
                height: size.width * .155,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.15),
                      blurRadius: 30,
                      offset: const Offset(0, 10),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(50),
                ),
                child: _buildBottomNavBar(size),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavBar(Size size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(5, (index) {
        return InkWell(
          onTap: () {
            setState(() {
              currentIndex = index;
            });
          },
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 170),
                curve: Curves.fastLinearToSlowEaseIn,
                margin: EdgeInsets.only(
                  bottom: index == currentIndex ? 0 : size.width * .029,
                ),
                width: size.width * .128,
                height: index == currentIndex ? size.width * .014 : 0,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(10),
                  ),
                ),
              ),
              index == currentIndex
                  ? Text(
                getLabel(index),
                style: TextStyle(
                  fontSize: size.width * .04,
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold,
                ),
              )
                  : Image.asset(
                getImagePath(index),
                width: size.width * .08,
                height: size.width * .08,
              ),
              SizedBox(height: size.width * .03),
            ],
          ),
        );
      }),
    );
  }

  String getImagePath(int index) {
    switch (index) {
      case 0:
        return 'assets/images/home.jpg';
      case 1:
        return 'assets/images/back.jpg';
      case 2:
        return 'assets/images/wallet.jpg';
      case 3:
        return 'assets/images/task.jpg';
      case 4:
        return 'assets/images/profile.jpg';
      default:
        return 'assets/images/home.jpg';
    }
  }

  String getLabel(int index) {
    switch (index) {
      case 0:
        return 'Home';
      case 1:
        return 'Ledger';
      case 2:
        return 'Wallet';
      case 3:
        return 'Task';
      case 4:
        return 'Profile';
      default:
        return '';
    }
  }
}
