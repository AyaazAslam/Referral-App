import 'package:flutter/material.dart';
import 'package:referalapp/widgets/custom_conatiner.dart';
import 'package:referalapp/widgets/custom_images.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 6, 26, 43),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.05), // Responsive padding
                  child: Text(
                    'Refer&Earn',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: isPortrait ? 20 : 24, // Adjust font size based on orientation
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                ListTile(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
                  tileColor: Colors.deepPurple,
                  title: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hi, ayaz',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Text('Amount in your wallet', style: TextStyle(color: Colors.white)),
                            SizedBox(width: 14),
                            Expanded(
                              child: Container(
                                  height: 30,


                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color: Colors.white
                                  ),
                                  child: Center(child: Text('\$145534', style: TextStyle(color: Colors.black, fontSize: 17,fontWeight: FontWeight.bold)))),
                            ),
                          ],
                        ),



                        SizedBox(height: 10,),

                        Row(
                          children: [
                            Text('Total referral', style: TextStyle(color: Colors.white)),
                            SizedBox(width: 10,),
                            SizedBox(width: 4),
                            Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Colors.white
                                ),
                                child: Center(child: Text('12', style: TextStyle(color: Colors.black, fontSize: 17,fontWeight: FontWeight.bold)))),

                          ],
                        ),

                      ],
                    ),
                  ),
                  trailing: Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/dollor.jpg'),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                CustomContainer(image: 'assets/images/invite.jpg'),

                // ListView.builder implementation
                SizedBox(height: 15),
                SizedBox(
                  height: size.height * 0.5, // Adjust height as necessary
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(), // Disable scrolling
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          CustomListile(
                            name: 'What Will My Friend Get?',
                            image: 'assets/images/dollor.jpg',
                            text1: 'They Will also get \$100 for every referral.',
                          ),
                          SizedBox(height: 14), // Separator height
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
