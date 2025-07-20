import 'package:flutter/material.dart';
import 'package:flutter_application_1/collection_history_page.dart';
import 'package:flutter_application_1/dashboard_page.dart';
import 'package:flutter_application_1/notification_page.dart';
import 'signup_page.dart';
import 'login_page.dart';
import 'home_page.dart';

void main() {
  runApp(DryWasteSegregationApp());
}

class DryWasteSegregationApp extends StatelessWidget {
  const DryWasteSegregationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dry Waste Segregation System',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomeScreen(),
        '/signup': (context) => SignUpPage(),
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/dashboard': (context) => DashboardPage(),
        '/notification': (context) => NotificationPage(),
        '/history': (context) => CollectionHistoryPage(),
      },
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Image.asset('assets/xentromall_logo.png', height: 400),

              // Title
              const Text(
                'Dry Waste Segregation System',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 80),

              // Sign Up/Log In title
              const Text(
                'Sign Up/Log In',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),

              // Sign Up Button
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/signup',
                    ); // To route to another page called signup_page.dart
                    // Navigate or handle sign-up
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 15),

              // Log In Button
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                    // Navigate or handle login
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  child: const Text(
                    'Log In',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
