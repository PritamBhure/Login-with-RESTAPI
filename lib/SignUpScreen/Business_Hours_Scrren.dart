import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'CompletionScreen.dart';

class BusinessHoursScreen extends StatefulWidget {
  late final String fullName;
  late final String email;
  final String phone;
  final String password;
  final String repassword;
  final String businessnmae;
  final String Information;
  final String Streetaddress;
  final String Zipcode;
  final String? selectedState;

  BusinessHoursScreen({
    required this.fullName,
    required this.email,
    required this.phone,
    required this.password,
    required this.repassword,
    required this.businessnmae,
    required this.Information,
    required this.Streetaddress,
    required  this.Zipcode,
    this.selectedState, // A
  });


  @override
  _BusinessHoursScreenState createState() => _BusinessHoursScreenState();
}

class _BusinessHoursScreenState extends State<BusinessHoursScreen> {
  // Selected time slots
  List<bool> isSelectedTimeSlot = [true, true, false, false, false, false];
  // Selected days of the week
  List<bool> isSelectedDay = [false, false, true, false, false, false, false];

  // Business hours as per selected days
  Map<String, List<String>> businessHours = {
    "mon": ["8:00am - 10:00am"],
    "tue": ["10:00am - 1:00pm"],
    "wed": [],
    "thu": [],
    "fri": [],
    "sat": [],
    "sun": []
  };

  // Function to send data to the API
  Future<void> sendRegistrationData() async {
    // Prepare the data for the request
    Map<String, dynamic> requestData = {
      "full_name": widget.fullName,
      "email": widget.email,
      "phone": widget.phone,
      "password": widget.password,
      "role": "farmer",  // Example fixed role
      "business_name": widget.businessnmae,
      "informal_name": widget.Information,
      "address": widget.Streetaddress,
      "city": "Poughkeepsie",  // Replace with your city variable
      "state": widget.selectedState ?? "New York",
      "zip_code": int.parse(widget.Zipcode),
      "registration_proof": "my_proof.pdf", // Replace with actual proof
      "business_hours": businessHours,
      "device_token": "sample_device_token", // Replace with actual token
      "type": "email",  // Fixed type for email
      "social_id": "",  // Blank for normal registration
    };

    // Make the POST request
    final url = Uri.parse("https://sowlab.com/assignment/user/register");
    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: json.encode(requestData),
      );

      if (response.statusCode == 200) {
        // Success: Handle the response
        print("Registration Successful");
        Navigator.push(context, MaterialPageRoute(builder: (context) => SuccessScreen()));
      } else {
        // Error: Handle the error
        print("Error: ${response.body}");
      }
    } catch (e) {
      print("Error during request: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
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
              'Signup 4 of 4 ',
              style: TextStyle(
                fontSize: screenWidth * 0.04,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            Text(
              'Business Hours',
              style: TextStyle(
                fontSize: screenWidth * 0.08,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            SizedBox(height: screenHeight * 0.02),

            // Subtitle
            Text(
              'Choose the hours your farm is open for pickups. This will allow customers to order deliveries.',
              style: TextStyle(
                fontSize: screenWidth * 0.035,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: screenHeight * 0.04),

            // Days of the week
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                for (int i = 0; i < isSelectedDay.length; i++)
                  _buildDayButton(
                    day: _getDayAbbreviation(i),
                    isSelected: isSelectedDay[i],
                    onTap: () {
                      setState(() {
                        isSelectedDay[i] = !isSelectedDay[i];
                      });
                    },
                  ),
              ],
            ),
            SizedBox(height: screenHeight * 0.04),

            // Time Slots
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 3.5,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: List.generate(isSelectedTimeSlot.length, (index) {
                  return _buildTimeSlotButton(
                    time: _getTimeSlot(index),
                    isSelected: isSelectedTimeSlot[index],
                    onTap: () {
                      setState(() {
                        isSelectedTimeSlot[index] = !isSelectedTimeSlot[index];
                      });
                    },
                  );
                }),
              ),
            ),

            // Signup Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  iconSize: screenWidth * 0.1,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(
                  width: screenHeight * 0.25,
                  height: screenHeight * 0.065,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to the next screen or handle form submission
                      sendRegistrationData();


                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFD5715B),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Signup',
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
    );
  }

  Widget _buildDayButton({
    required String day,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFFD5715B) : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade400),
        ),
        alignment: Alignment.center,
        child: Text(
          day,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildTimeSlotButton({
    required String time,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFFFFE0B2) : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: Text(
          time,
          style: TextStyle(
            color: isSelected ? Colors.black : Colors.grey,
          ),
        ),
      ),
    );
  }

  String _getDayAbbreviation(int index) {
    switch (index) {
      case 0:
        return 'M';
      case 1:
        return 'T';
      case 2:
        return 'W';
      case 3:
        return 'Th';
      case 4:
        return 'F';
      case 5:
        return 'S';
      case 6:
        return 'Su';
      default:
        return '';
    }
  }

  String _getTimeSlot(int index) {
    switch (index) {
      case 0:
        return '8:00am - 10:00am';
      case 1:
        return '10:00am - 1:00pm';
      case 2:
        return '1:00pm - 4:00pm';
      case 3:
        return '4:00pm - 7:00pm';
      case 4:
        return '7:00pm - 10:00pm';
      default:
        return '';
    }
  }
}