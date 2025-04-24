import 'package:flutter/material.dart';
import 'package:gymverse_frontend/screens/home_screen.dart';
import 'package:gymverse_frontend/screens/profile_screen.dart';
import 'package:gymverse_frontend/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GymVerse',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) =>
            const LoginScreen(), // Directly navigate to LoginScreen
        '/home': (context) => HomeScreen(), // Directly navigate to HomeScreen
        '/profile': (context) =>
            const ProfileScreen(), // Directly navigate to ProfileScreen (with registration functionality)
      },
    );
  }
}
