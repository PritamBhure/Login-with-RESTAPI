import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../LoginScreen/loginscreen.dart';
import 'Farm_Info.dart';



class SignupWelcomescreen extends StatelessWidget {
  @override
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repasswordController = TextEditingController();





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
                'Welcome !',
                style: TextStyle(
                  fontSize: screenWidth * 0.08,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SvgPicture.asset(
                        'Assets/LoginScreen/logo_background.svg',
                        width: screenWidth * 0.25,
                      ),
                      SvgPicture.asset(
                        'Assets/LoginScreen/google_logo.svg',
                        width: screenWidth * 0.08,
                      ),
                    ],
                  ),
                  SizedBox(width: screenWidth * 0.04),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SvgPicture.asset(
                        'Assets/LoginScreen/logo_background.svg',
                        width: screenWidth * 0.25,
                      ),
                      SvgPicture.asset(
                        'Assets/LoginScreen/apple_logo.svg',
                        width: screenWidth * 0.08,
                      ),
                    ],
                  ),
                  SizedBox(width: screenWidth * 0.04),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SvgPicture.asset(
                        'Assets/LoginScreen/logo_background.svg',
                        width: screenWidth * 0.25,
                      ),
                      SvgPicture.asset(
                        'Assets/LoginScreen/Facebook.svg',
                        width: screenWidth * 0.08,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.02),
              Center(
                child: Text(
                  'or signup with ',
                  style: TextStyle(
                    fontSize: screenWidth * 0.02,
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              // Full Name TextFormField
              TextFormField(
                controller: fullNameController,
                decoration: InputDecoration(

                  labelText: 'Full Name',
                  labelStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.person_outline),
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
              // Email TextFormField
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email Address',
                  labelStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.alternate_email),
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
                controller: phoneController,                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  labelStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.phone_outlined),
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
              // Password TextFormField
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.lock_outline),
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
              // Re-enter Password TextFormField
              TextFormField(
                controller: repasswordController,
                decoration: InputDecoration(
                  labelText: 'Re-enter Password',
                  labelStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.lock_outline),
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
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Form_Info(
                              fullName: fullNameController.text,
                              email: emailController.text,
                              phone: phoneController.text,
                              password: passwordController.text,
                              repassword: repasswordController.text,
                            ),
                          ),
                        );
                      },
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
