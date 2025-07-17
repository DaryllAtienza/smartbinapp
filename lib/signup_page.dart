import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              // Top header design
              Container(
                width: double.infinity,
                height: 180,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF2972FE), Color(0xFF28C76F)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(60),
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 40,
                      left: 20,
                      child: Text(
                        'Create your account.',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 20,
                      right: 20,
                      child: Image.asset(
                        'assets/xentromall_logo.png',
                        height: 120,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),

              // Centered form
              Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 400),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Email Field
                      const Text(
                        'Email',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                          hintText: 'Enter your email here',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Colors.blue),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue,
                              width: 2,
                            ),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Password Field
                      const Text(
                        'Password',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: '********',
                          suffixIcon: const Icon(
                            Icons.lock_outline,
                            color: Colors.blue,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Colors.blue),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue,
                              width: 2,
                            ),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),

                      // Sign Up Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Sign-up successful!'),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF0050C8),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Already Registered Text
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/login');
                          },
                          child: const Text(
                            'Already Registered?\nLog in here.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Back to Home
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              '/',
                              (route) => false,
                            );
                          },
                          child: const Text(
                            '← Back to Welcome Screen',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ],
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
