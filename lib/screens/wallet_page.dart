import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:referalapp/widgets/custom_button.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  final ImagePicker _picker = ImagePicker();
  String? _imagePath;

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
      final pickedFile = await _picker.pickImage(source: source);
      if (pickedFile != null) {
        setState(() {
          _imagePath = pickedFile.path;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 6, 26, 43),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 6, 26, 43),
        title: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            "Wallet",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: isPortrait ? 20 : 24,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 20), // Space before the card
          _buildBalanceCard(isPortrait),
          SizedBox(height: 20), // Space between card and UPI Transfer
          Center(
            child: Text(
              "UPI Transfer",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
          SizedBox(height: 20), // Space before the container
          GestureDetector(
            onTap: _pickImage,
            child: Container(
              height: 250,
              width: 330,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 2),
                color: Colors.transparent,
              ),
              child: Center(
                child: _imagePath != null
                    ? Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8), // Optional: for rounded corners
                    color: Colors.grey[300], // Optional: background color for placeholder
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8), // Optional: match the container's border radius
                    child: Image.file(
                      File(_imagePath!),
                      fit: BoxFit.cover, // Fill the container and maintain aspect ratio
                    ),
                  ),
                )
                    : Icon(Icons.upload_file, size: 80, color: Colors.white),
              ),

            ),
          ),
          SizedBox(height: 30,),

          Container(
             height: 40,
              width: 300,
              child: Custombutton(text: "Upload"))// Space before the button
          // ElevatedButton(
          //   onPressed: _imagePath != null ? () {
          //     // Handle upload action
          //     print('Image uploaded: $_imagePath');
          //   } : null, // Disable button if no image is selected
          //   child: Text("Upload"),
          // ),
        ],
      ),
    );
  }

  Widget _buildBalanceCard(bool isPortrait) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.deepPurple,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Total Balance",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: isPortrait ? 20 : 24,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "₹1233",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: isPortrait ? 20 : 24,
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Total Referral",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: isPortrait ? 20 : 24,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "124",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: isPortrait ? 20 : 24,
            ),
          ),
        ],
      ),
    );
  }
}
