import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final gradientColor = const LinearGradient(
      colors: [Color(0xFF0F63F5), Color(0xFF17C37B)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Column(
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return gradientColor.createShader(bounds);
                    },
                    child: const Text(
                      'Dashboard',
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // masked by gradient
                      ),
                    ),
                  ),
                  Image.asset('assets/xentromall_logo.png', height: 50),
                ],
              ),
              const SizedBox(height: 30),

              // Dashboard Grid
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  children: const [
                    DashboardTile(
                      icon: Icons.delete,
                      percentage: 1.0,
                      label: 'Plastic',
                      color: Color(0xFF0F63F5),
                    ),
                    DashboardTile(
                      icon: Icons.description,
                      percentage: 0.75,
                      label: 'Paper',
                      color: Color(0xFF17C37B),
                    ),
                    DashboardTile(
                      icon: Icons.local_drink,
                      percentage: 0.5,
                      label: 'Can',
                      color: Color(0xFFFFC107),
                    ),
                    DashboardTile(
                      icon: Icons.question_mark,
                      percentage: 0.25,
                      label: 'Unrecognized',
                      color: Color(0xFFEB4335),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              // Home Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.home, color: Colors.white),
                  label: const Text(
                    'Back to Home',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0F63F5),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
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

class DashboardTile extends StatelessWidget {
  final IconData icon;
  final double percentage;
  final String label;
  final Color color;

  const DashboardTile({
    super.key,
    required this.icon,
    required this.percentage,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final percentValue = (percentage * 100).toInt();

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color.withOpacity(0.1),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Circular indicator
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 80,
                width: 80,
                child: CircularProgressIndicator(
                  value: percentage,
                  strokeWidth: 10,
                  backgroundColor: Colors.grey[300],
                  valueColor: AlwaysStoppedAnimation<Color>(color),
                ),
              ),
              Text(
                '$percentValue%',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Icon
          Icon(icon, color: color, size: 28),
          const SizedBox(height: 6),

          // Label
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
