import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login/LoginScreen/Login_Screen_without_Provider.dart';

class SuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1,vertical: screenHeight * 0.1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // SVG Checkmark Icon

            SizedBox(
              height: screenHeight *0.1,

                child: Image.asset("Assets/SignupScreen/Vector@2x.png")),

            SizedBox(height: screenHeight * 0.05),

            // Title
            Text(
              "You’re all done!",
              style: TextStyle(
                fontSize: screenWidth * 0.08,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: screenHeight * 0.05),

            // Subtitle
            Text(
              "Hang tight! We are currently reviewing your account and will follow up with you in 2-3 business days. In the meantime, you can setup your inventory.",
              style: TextStyle(
                fontSize: screenWidth * 0.034,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: screenHeight * 0.3),

            // Button
            ElevatedButton(
              onPressed: () {
                // Handle button press
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFD5715B), // Custom button color
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.3,
                  vertical: screenHeight * 0.02,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                'Got it!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenWidth * 0.045,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
