import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/SignUpScreen/Signup_welcomeScreen.dart';

import 'OnboardingScreen/onboarding_screen.dart';
import 'SignUpScreen/Farm_Info.dart';
import 'SignUpScreen/Verification_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // Apply the "Be Vietnam" font across the app
        textTheme: GoogleFonts.beVietnamProTextTheme(
          Theme.of(context).textTheme,
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  Onbording(),
    );
  }
}


