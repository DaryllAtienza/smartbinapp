import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final buttonWidth = MediaQuery.of(context).size.width * 0.9;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
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
                      'Home',
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

            Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    buildNavButton(
                      context,
                      width: buttonWidth,
                      icon: Icons.dashboard,
                      text: 'Dashboards',
                      onTap: () {
                        Navigator.pushNamed(context, '/dashboard');
                      },
                    ),
                    const SizedBox(height: 20),
                    buildNavButton(
                      context,
                      width: buttonWidth,
                      icon: Icons.notifications,
                      text: 'Notifications',
                      onTap: () {
                        Navigator.pushNamed(context, '/notification');
                      },
                    ),
                    const SizedBox(height: 20),
                    buildNavButton(
                      context,
                      width: buttonWidth,
                      icon: Icons.history,
                      text: 'Collection History',
                      onTap: () {},
                    ),
                    const SizedBox(height: 20),
                    buildNavButton(
                      context,
                      width: buttonWidth,
                      icon: Icons.logout,
                      text: 'Log Out',
                      onTap: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          '/',
                          (route) => false,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildNavButton(
    BuildContext context, {
    required double width,
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: width,
      child: ElevatedButton.icon(
        onPressed: onTap,
        icon: Icon(icon, size: 28, color: Colors.white),
        label: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF0050C8),
          minimumSize: const Size.fromHeight(60),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16),
        ),
      ),
    );
  }
}
