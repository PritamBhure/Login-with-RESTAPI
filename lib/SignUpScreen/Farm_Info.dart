import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../LoginScreen/loginscreen.dart';
import 'Verification_Screen.dart';

class Form_Info extends StatelessWidget {
  final String fullName;
  final String email;
  final String phone;
  final String password;
  final String repassword;

  Form_Info({
    required this.fullName,
    required this.email,
    required this.phone,
    required this.password,
    required this.repassword,
  });

  final TextEditingController businessnameController = TextEditingController();
  final TextEditingController InformalnameController = TextEditingController();
  final TextEditingController StreetaddressController = TextEditingController();
  final TextEditingController CityController = TextEditingController();
  final TextEditingController ZipcodeController = TextEditingController();

 String? selectedState;

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

              // Business Name TextFormField
              TextFormField(
                controller: businessnameController,
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

              // Informal Name TextFormField
              TextFormField(
                controller: InformalnameController,
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

              // Street Address TextFormField
              TextFormField(
                controller: StreetaddressController,
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
                controller: CityController,
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

              // State and Zipcode Row
              Row(
                children: [
                  // Dropdown for State
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.001,
                        horizontal: screenWidth * 0.001,
                      ),
                      child: DropdownButtonFormField<String>(
                        value: null, // Default value null for empty selection
                        decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none, // No border
                        ),
                        hint: Text('State'), // Placeholder hint
                        items: [
                          'Andhra Pradesh', 'Arunachal Pradesh', 'Assam', 'Bihar', 'Chhattisgarh',
                          'Goa', 'Gujarat', 'Haryana', 'Himachal Pradesh', 'Jharkhand',
                          'Karnataka', 'Kerala', 'Madhya Pradesh', 'Maharashtra', 'Manipur',
                          'Meghalaya', 'Mizoram', 'Nagaland', 'Odisha', 'Punjab',
                          'Rajasthan', 'Sikkim', 'Tamil Nadu', 'Telangana', 'Tripura',
                          'Uttar Pradesh', 'Uttarakhand', 'West Bengal'
                        ].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(fontSize: screenWidth * 0.03),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          selectedState = newValue;
                        },
                        icon: Icon(Icons.arrow_drop_down, color: Colors.black),
                      ),
                    ),
                  ),

                  SizedBox(width: screenWidth * 0.01), // Space between fields

                  // Zipcode TextFormField
                  Expanded(
                    child: TextFormField(
                      controller: ZipcodeController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Enter Zipcode',
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
                  ),
                ],
              ),

              SizedBox(height: screenHeight * 0.15),

              // Continue Button with Arrow Icon
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    iconSize: screenWidth*0.1,

                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(
                    width: screenHeight * 0.25,
                    height: screenHeight * 0.065,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VerificationScreen(
                              fullName: fullName,
                              email: email,
                              phone: phone,
                              password: password,
                              repassword: repassword,
                              businessnmae: businessnameController.text,
                              Information: InformalnameController.text,
                              Streetaddress: StreetaddressController.text,
                              Zipcode: ZipcodeController.text,
                              selectedState: selectedState,
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Continue',
                            style: TextStyle(
                              fontSize: screenWidth * 0.04,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 5), // Space between text and icon

                        ],
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
