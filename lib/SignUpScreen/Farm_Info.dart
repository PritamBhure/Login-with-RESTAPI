import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../LoginScreen/loginscreen.dart';



class Form_Info extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.08, vertical: screenWidth * 0.1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'FarmerEats',
                style: TextStyle(
                  fontSize: screenWidth * 0.04,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: screenHeight * 0.04),
              Text(
                'Signup 1 of 4 ',
                style: TextStyle(
                  fontSize: screenWidth * 0.04,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              Text(
                'Farm Info',
                style: TextStyle(
                  fontSize: screenWidth * 0.08,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: screenHeight * 0.03),

              // Full Name TextFormField
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Business Name',
                  labelStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.cabin),
                  filled: true,
                  fillColor: Colors.grey[50],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.02,
                    horizontal: screenWidth * 0.03,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.025),
              // Information TextFormField
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Informal Name',
                  labelStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.tag_faces),
                  filled: true,
                  fillColor: Colors.grey[50],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.02,
                    horizontal: screenWidth * 0.03,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.025),
              // Phone Number TextFormField
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Street Address',
                  labelStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.home_outlined),
                  filled: true,
                  fillColor: Colors.grey[50],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.02,
                    horizontal: screenWidth * 0.03,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.025),
              // City TextFormField
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'City',
                  labelStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.location_on_outlined),
                  filled: true,
                  fillColor: Colors.grey[50],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.02,
                    horizontal: screenWidth * 0.03,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.025),
              // Zipcode  TextFormField
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'EnterZipcode',
                  labelStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.grey[50],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.02,
                    horizontal: screenWidth * 0.03,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.04),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        color: Colors.black,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: screenHeight * 0.25,
                    height: screenHeight * 0.065,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFD5715B),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: Text(
                        'Continue',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.05,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
