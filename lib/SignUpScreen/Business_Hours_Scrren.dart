import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          bodyMedium: TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
      ),
      home: BusinessHoursScreen(),
    );
  }
}

class BusinessHoursScreen extends StatefulWidget {
  @override
  _BusinessHoursScreenState createState() => _BusinessHoursScreenState();
}

class _BusinessHoursScreenState extends State<BusinessHoursScreen> {
  // Selected time slots
  List<bool> isSelectedTimeSlot = [true, true, false, false, false, false];
  // Selected days of the week
  List<bool> isSelectedDay = [false, false, true, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.08,
          vertical: screenHeight * 0.08,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Back Button and Title
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Text(
                  'FarmerEats',
                  style: TextStyle(
                    fontSize: screenWidth * 0.04,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.02),

            // Signup Step Info
            Text(
              'Signup 4 of 4',
              style: TextStyle(
                fontSize: screenWidth * 0.04,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: screenHeight * 0.02),

            // Main Title
            Text(
              'Business Hours',
              style: TextStyle(
                fontSize: screenWidth * 0.08,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
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
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Perform signup action here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFD5715B), // Button background color
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.2,
                    vertical: screenHeight * 0.02,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: Text(
                  'Signup',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth * 0.045,
                  ),
                ),
              ),
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
