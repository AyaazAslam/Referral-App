import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter/services.dart'; // Import for Clipboard

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? _imagePath; // Changed to nullable to handle no image case
  final ImagePicker _picker = ImagePicker();
  final String referralCode = "ABra@3dfgsg#C123"; // Sample referral code
  bool _passwordVisible = false; // For password visibility toggle
  String password = "YourPassword123"; // Sample password
  String firstName = "Ayaz";
  String lastName = "Aslam";

  Future<void> _pickImage() async {
    final source = await showDialog<ImageSource>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Choose Image Source'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, ImageSource.camera),
              child: const Text('Camera'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, ImageSource.gallery),
              child: const Text('Gallery'),
            ),
          ],
        );
      },
    );

    if (source != null) {
      final XFile? image = await _picker.pickImage(source: source);
      if (image != null) {
        setState(() {
          _imagePath = image.path; // Update the image path
        });
      }
    }
  }

  void _copyToClipboard() {
    Clipboard.setData(ClipboardData(text: referralCode));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Referral code copied: $referralCode')),
    );
  }
  void _editProfile() {
    final TextEditingController firstNameController = TextEditingController(text: firstName);
    final TextEditingController lastNameController = TextEditingController(text: lastName);
    final TextEditingController passwordController = TextEditingController(text: password);
    bool passwordVisibleInDialog = false; // State variable for dialog password visibility

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Container(
            height: 60,
            width: 60,
            child: Image.asset("assets/images/profile.jpg"),
          ),
          content: SingleChildScrollView(
            child: StatefulBuilder(
              builder: (context, setState) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: firstNameController,
                      decoration: InputDecoration(labelText: 'First Name'),
                    ),
                    TextField(
                      controller: lastNameController,
                      decoration: InputDecoration(labelText: 'Last Name'),
                    ),
                    TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        suffixIcon: IconButton(
                          icon: Icon(
                            passwordVisibleInDialog ? Icons.visibility : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              passwordVisibleInDialog = !passwordVisibleInDialog; // Toggle visibility
                            });
                          },
                        ),
                      ),
                      obscureText: !passwordVisibleInDialog, // Show/hide password
                    ),
                  ],
                );
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  firstName = firstNameController.text;
                  lastName = lastNameController.text;
                  password = passwordController.text;
                });
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
          ],
        );
      },
      barrierDismissible: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool isIOS = Platform.isIOS;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 120, top: 50),
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
                color: Colors.indigo,
              ),
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 80,
                    backgroundColor: Colors.grey[300],
                    child: _imagePath != null
                        ? ClipOval(
                      child: Image.file(
                        File(_imagePath!),
                        width: 160,
                        height: 160,
                        fit: BoxFit.cover,
                      ),
                    )
                        : Text(
                      "Select Profile",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 122,
                    left: 115,
                    child: InkWell(
                      onTap: _pickImage,
                      child: Icon(Icons.camera_alt, size: 40, color: Colors.white),
                    ),
                  ),
                  Positioned(
                    top: 170,
                    left: 23,
                    child: Text(
                      "$firstName $lastName",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Positioned(
                    top: -2,
                    left: 220,
                    child: IconButton(
                      icon: Icon(Icons.edit, size: 25, color: Colors.white),
                      onPressed: _editProfile,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30,),
            Container(

              margin: EdgeInsets.all(30),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildCard(Icons.email, "ayazaslam@gmail.com"),
                  SizedBox(height: 20),
                  _buildPasswordCard(),
                  SizedBox(height: 20),
                  _buildCardWithColumn("Joined By", Icons.people, "12#2323"),
                  SizedBox(height: 30),
                  _buildReferralRow(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReferralRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          children: [
            Icon(Icons.qr_code, size: 30),
            SizedBox(width: 10),
            Text("Referral Code:"),
          ],
        ),
        InkWell(
          onTap: _copyToClipboard,
          child: Row(
            children: [
              Text(referralCode),
              SizedBox(width: 10),
              Icon(Icons.copy, size: 30),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordCard() {
    return Container(
      padding: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      height: 60,
      child: Row(
        children: [
          Icon(Icons.lock),
          SizedBox(width: 40),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _passwordVisible ? password : "**********",
                  style: TextStyle(fontSize: 16),
                ),
                IconButton(
                  icon: Icon(
                    _passwordVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(IconData icon, String text) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      height: 60,
      child: Row(
        children: [
          Icon(icon),
          SizedBox(width: 40),
          Text(text),
        ],
      ),
    );
  }

  Widget _buildCardWithColumn(String title, IconData icon, String text) {
    return Container(
      padding: EdgeInsets.only(left: 10,top: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      height: 60,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 10),
              ),
              SizedBox(width: 60),
              Icon(icon),
            ],
          ),
          Text(text),
        ],
      ),
    );
  }
}
