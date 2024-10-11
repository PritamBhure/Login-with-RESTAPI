import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'loginscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RestPasswordScreen(),
    );
  }
}

class RestPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Use MediaQuery to get screen height and width for responsiveness
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08,vertical: screenWidth * 0.2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'FarmerEats',
              style: TextStyle(
                fontSize: screenWidth * 0.04, // Responsive font size
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),
            SizedBox(height: screenHeight * 0.1), // Responsive spacing
            Text(
              'Reset Password',
              style: TextStyle(
                fontSize: screenWidth * 0.08,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),


            SizedBox(height: screenHeight * 0.03),
            Row(
              children: [
                Text(
                  'Remember your pasword? ',
                  style: TextStyle(
                    fontSize: screenWidth * 0.04,
                    color: Colors.grey,
                  ),
                ),

                TextButton(
                  onPressed: () {
                    // Navigate to LoginScreen on press
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      color: Color(0xFFD5715B),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ), //LoginScreen
              ],
            ),


            SizedBox(height: screenHeight * 0.07),


            // Email TextFormField without borders
            TextFormField(


              decoration: InputDecoration(
                labelText: 'New Password',
                labelStyle: TextStyle(color: Colors.grey),

                prefixIcon: Icon(Icons.lock_outline),
                filled: true,
                fillColor: Colors.grey[50],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded edges
                  borderSide: BorderSide.none, // Remove the outer border
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.02,
                  horizontal: screenWidth * 0.03,
                ),
              ),
            ),


            SizedBox(height: screenHeight * 0.03),


            // Password TextFormField without borders
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(

                labelText: 'Confirm New Password',
                labelStyle: TextStyle(color: Colors.grey),
                prefixIcon: Icon(Icons.lock_outline),
                filled: true,
                fillColor: Colors.grey[50],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded edges
                  borderSide: BorderSide.none, // Remove the outer border
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.02,
                  horizontal: screenWidth * 0.03,
                ),
              ),
            ),




            SizedBox(height: screenHeight * 0.04),

//Submit Button
            Center(
              child: SizedBox(
                width: double.infinity,
                height: screenHeight * 0.065, // Responsive button height
                child: ElevatedButton(
                  onPressed: () {
                    // Add your login logic here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFD5715B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.05, // Responsive font size
                    ),
                  ),
                ),
              ),
            ),



          ],
        ),
      ),
    );
  }
}
