import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🟦 Floating Header
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF2972FE), Color(0xFF28C76F)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(28),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Notifications',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        'System updates and alerts',
                        style: TextStyle(fontSize: 16, color: Colors.white70),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Image.asset('assets/xentromall_logo.png', height: 60),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 🔔 Notification Cards
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  notificationCard("Bin (Plastic) is full. Please empty it."),
                  const SizedBox(height: 16),
                  notificationCard("Bin (Paper) is almost full."),
                  const SizedBox(height: 16),
                  notificationCard(" Bin (Can) is almost full."),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 🔙 Home Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/home');
                  },
                  icon: const Icon(Icons.home, color: Colors.white),
                  label: const Text(
                    'Back to Home',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2972FE),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 5,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // 🎨 Stylized Notification Card
  Widget notificationCard(String message) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.85),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 8,
            offset: const Offset(2, 4),
          ),
        ],
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          const Icon(Icons.notifications_active, color: Color(0xFF2972FE)),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(fontSize: 16, color: Color(0xFF333333)),
            ),
          ),
        ],
      ),
    );
  }
}
