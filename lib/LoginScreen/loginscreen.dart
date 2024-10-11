import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
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
              'Welcome back!',
              style: TextStyle(
                fontSize: screenWidth * 0.1,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),


            SizedBox(height: screenHeight * 0.03),
            Row(
              children: [
                Text(
                  'New here? ',
                  style: TextStyle(
                    fontSize: screenWidth * 0.04,
                    color: Colors.grey,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Add your sign-up logic here
                  },
                  child: Text(
                    'Create account',
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      color: Color(0xFFD5715B),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),


            SizedBox(height: screenHeight * 0.07),


            // Email TextFormField without borders
            TextFormField(


              decoration: InputDecoration(
                labelText: 'Email Address',
                  labelStyle: TextStyle(color: Colors.grey),

                prefixIcon: Icon(Icons.alternate_email),
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

                labelText: 'Password',
                labelStyle: TextStyle(color: Colors.grey),
                prefixIcon: Icon(Icons.lock_outline),
                suffixText: 'Forgot?',
                suffixStyle: TextStyle(
                  color: Color(0xFFD5715B),
                  fontWeight: FontWeight.normal,
                ),
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

//Login Button
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
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.05, // Responsive font size
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            Center(
              child: Text(
                'or login with',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Google Logo with background
                Stack(

                  alignment: Alignment.center,
                  children: [
                    SvgPicture.asset(
                      'Assets/LoginScreen/logo_background.svg',
                      width: screenWidth * 0.25, // Adjust background size
                    ),
                    SvgPicture.asset(
                      'Assets/LoginScreen/google_logo.svg',
                      width: screenWidth * 0.08, // Adjust logo size
                    ),
                  ],
                ),
                SizedBox(width: screenWidth * 0.04),

                // Apple Logo with background
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SvgPicture.asset(
                      'Assets/LoginScreen/logo_background.svg',
                      width: screenWidth * 0.25, // Adjust background size
                    ),
                    SvgPicture.asset(
                      'Assets/LoginScreen/apple_logo.svg',
                      width: screenWidth * 0.08, // Adjust logo size
                    ),
                  ],
                ),
                SizedBox(width: screenWidth * 0.04),

                // Facebook Logo with background
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SvgPicture.asset(
                      'Assets/LoginScreen/logo_background.svg',
                      width: screenWidth * 0.25, // Adjust background size
                    ),
                    SvgPicture.asset(
                      'Assets/LoginScreen/Facebook.svg',
                      width: screenWidth * 0.08, // Adjust logo size
                    ),
                  ],
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
