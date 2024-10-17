import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:login/SignUpScreen/Business_Hours_Scrren.dart';

class VerificationScreen extends StatefulWidget {
  final String fullName;
  final String email;
  final String phone;
  final String password;
  final String repassword;
  final String businessnmae;
  final String Information;
  final String Streetaddress;
  final String Zipcode;
  final String? selectedState; // Add state parameter

  VerificationScreen({
    required this.fullName,
    required this.email,
    required this.phone,
    required this.password,
    required this.repassword,
    required this.businessnmae,
    required this.Information,
    required this.Streetaddress,
    required this.Zipcode,
    this.selectedState, // Accept state parameter
  });

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  String? selectedFile;

  void _pickFile() async {
    // Show file picker dialog
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false, // Allow single file selection
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf'], // Supported file types
    );

    if (result != null) {
      setState(() {
        selectedFile = result.files.single.name; // Get the selected file name
      });
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
              'Signup 3 of 4 ',
              style: TextStyle(
                fontSize: screenWidth * 0.04,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            Text(
              'Verification',
              style: TextStyle(
                fontSize: screenWidth * 0.08,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: screenHeight * 0.03),

            Text(
              'Attach proof of Department of Agriculture registrations i.e. Florida Fresh, USDA Approved, USDA Organic',
              style: TextStyle(
                fontSize: screenWidth * 0.034,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 20),

            // File upload section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Display "Attach proof of registration" text
                Text(
                  'Attach proof of registration',
                  style: TextStyle(
                    fontSize: screenWidth * 0.04,
                    color: Colors.black,
                  ),
                ),

                // Camera icon button
                Container(
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(
                    color:
                        Color(0xFFD5715B), // Background color for the container
                    shape: BoxShape.circle, // Makes the container circular
                  ),
                  child: IconButton(
                    icon: Icon(Icons.camera_alt_outlined),
                    color: Colors.white,
                    onPressed: _pickFile, // Handle file selection/upload
                    iconSize: 30,
                    padding: EdgeInsets.zero,
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),

            // If a file is selected, show the file name along with a close icon
            if (selectedFile != null)
              Container(
                color: Colors.grey[100],
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Display the selected file name
                    Expanded(
                      child: Text(
                        selectedFile!,
                        style: TextStyle(
                          fontSize: screenWidth * 0.045,
                          color: Colors.black,
                        ),
                        overflow:
                            TextOverflow.ellipsis, // Truncate long file names
                      ),
                    ),

                    // Close icon to remove the selected file
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedFile = null; // Remove file
                        });
                      },
                      child: Icon(
                        Icons.close,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            SizedBox(height: screenHeight * 0.42),
            // Submit button
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
                      _submitVerification();

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BusinessHoursScreen(
                            fullName: widget.fullName,
                            email: widget.email,
                            phone: widget.phone,
                            password: widget.password,
                            repassword: widget.repassword,
                            businessnmae: widget.businessnmae,
                            Information: widget.Information,
                            Streetaddress: widget.Streetaddress,
                            Zipcode: widget.Zipcode,
                            selectedState: widget.selectedState,
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
                    child:  Row(
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
    );
  }

  // Placeholder for form submission logic
  void _submitVerification() {
    if (selectedFile != null) {
      // Handle the form submission and selected file upload
      print('Form submitted with selected file: $selectedFile');
    } else {
      // Show a message to select a file
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please attach a proof of registration file')),
      );
    }
  }
}
