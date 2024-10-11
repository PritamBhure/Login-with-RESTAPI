import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.green[500], // Green background for the scaffold
        body: MyCustomScreen(),
      ),
    );
  }
}

class MyCustomScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          // Center the image in the Scaffold

          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 400),
              child: Container(

                width: 500, // Adjust image width as needed
                height: 500, // Adjust image height as needed
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('Assets/OnbordingScreen/onboarding1.png'), // Your image path
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),

          // Bottom white container with rounded top edges
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.45, // Adjust height as needed
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), // Rounded top left corner
                  topRight: Radius.circular(40), // Rounded top right corner
                ),
              ),
              child: Column(
                children: [
                  buildOnboardingPage(
 // Add your asset image here
                    title: 'Quality',
                    description:
                    'Sell your farm fresh products directly to consumers, cutting out the middleman and reducing emissions of the global supply chain.',
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: List.generate(
                        //     3, // Number of pages
                        //         (index) => buildDot(index, context),
                        //   ),
                        // ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            // Add action for "Join the movement!"
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green, // Button background color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                          ),
                          child: const Text('Join the movement!'),
                        ),
                        TextButton(
                          onPressed: () {
                            // Navigate to Login screen
                          },
                          child: const Text('Login'),
                        ),
                      ],
                    ),
                  ),
                ],

              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildOnboardingPage({ required String title, required String description}) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 30),
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

}
