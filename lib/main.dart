import 'package:flutter/material.dart';
import 'splash.dart';  // Import splash screen file
import 'menu.dart';    // Import menu file
import 'testing.dart'; // Make sure this exists
import 'audiometry.dart'; // Make sure this exists
import 'descripe.dart'; // Make sure this exists

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashWidget(), // Initially showing SplashWidget
      routes: {
        'testing': (context) => const TestingWidget(), // Define 'testing' route
        'audiometry': (context) => const AudiometryWidget(), // Define 'audiometry' route
        'descripe': (context) => const DescripeWidget(),
        'menu': (context) => const MenuWidget(),
      },
    );
  }
}
