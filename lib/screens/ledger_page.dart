import 'package:flutter/material.dart';
import 'package:referalapp/models/users_page.dart';
import 'package:referalapp/widgets/my_widget_button.dart';

class LedgerScreen extends StatefulWidget {
  const LedgerScreen({super.key});

  @override
  State<LedgerScreen> createState() => _LedgerScreenState();
}

class _LedgerScreenState extends State<LedgerScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;

  List<Users> users = [
    Users(name: "Ayaz Aslam", profile: "assets/images/ayaz.jpg", dateTime: "2 days ago"),
    Users(name: "Muskan Akbar", profile: "assets/images/ayaz.jpg", dateTime: "2 days ago"),
    Users(name: "Wasay Hashmi", profile: "assets/images/ayaz.jpg", dateTime: "2 days ago"),
    Users(name: "Cheeku", profile: "assets/images/ayaz.jpg", dateTime: "1 day ago"),
    // Add more users as needed
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black.withOpacity(0.9),
        title: Text(
          "Earnings",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          // Tab Bar
          Row(
            children: [
              _buildTabButton("Successful Referral", 0),
              _buildTabButton("WithDraw", 1),
            ],
          ),

          // Tab Content
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Tab 1 Content
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.9),
                  ),
                  child: users.isEmpty
                      ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.warning, size: 50, color: Colors.white),
                        SizedBox(height: 10),
                        Text(
                          "No Data Found",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ],
                    ),
                  )
                      :ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 20,
                              backgroundImage: AssetImage(users[index].profile), // Use backgroundImage instead of child
                            ),
                            title: Text(
                              users[index].name!,
                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold), // Bold text
                            ),
                            trailing: Text(
                              users[index].dateTime,
                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold), // Bold text
                            ),
                          ),
                        ),
                      );
                    },
                  )

                ),
                // Tab 2 Content
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.9),
                  ),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyWidget(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabButton(String title, int index) {
    return Expanded(
      child: GestureDetector(
        onTap: () => _tabController.animateTo(index),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          decoration: BoxDecoration(
            color: _selectedIndex == index ? Colors.purple[700] : Colors.white,

            border: Border(
              bottom: BorderSide(
                color: _selectedIndex == index ? Colors.purple[700]! : Colors.transparent,
                width: 3,
              ),
            ),
          ),
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: _selectedIndex == index ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
