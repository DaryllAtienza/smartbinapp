import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
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
              // Gradient Header
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
                    const Positioned(
                      top: 40,
                      left: 20,
                      child: Text(
                        'Login',
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

              // Form
              Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 400),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Email',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: 'Enter your email here',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue,
                              width: 2,
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 12),
                        ),
                      ),
                      const SizedBox(height: 20),

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
                          suffixIcon: Icon(
                            Icons.lock_outline,
                            color: Colors.blue,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue,
                              width: 2,
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 12),
                        ),
                      ),
                      const SizedBox(height: 30),

                      // Login Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            // ✅ Redirect to home page after login
                            Navigator.pushNamed(context, '/home');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF0050C8),
                            padding: EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            'Log In',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Sign Up Link
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/signup');
                          },
                          child: const Text(
                            'Not registered?\nSign up here.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black87,
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
