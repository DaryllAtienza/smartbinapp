import 'package:flutter/material.dart';

class CollectionHistoryPage extends StatelessWidget {
  const CollectionHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final gradient = const LinearGradient(
      colors: [Color(0xFF0F63F5), Color(0xFF17C37B)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );

    final historyItems = [
      'Plastic bin emptied on Feb 3 at 3:30PM.',
      'Can bin emptied on Feb 3 at 3:45PM.',
      'Paper bin emptied on Feb 3 at 4:00PM.',
      'Unrecognized bin emptied on Feb 3 at 4:15PM.',
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with gradient title and logo
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ShaderMask(
                    shaderCallback: (bounds) => gradient.createShader(bounds),
                    child: const Text(
                      'Collection\nHistory',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // masked by shader
                      ),
                    ),
                  ),
                  Image.asset('assets/xentromall_logo.png', height: 60),
                ],
              ),
              const SizedBox(height: 24),

              // History entries
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black54),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: ListView.separated(
                    itemCount: historyItems.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          historyItems[index],
                          style: const TextStyle(fontSize: 16),
                        ),
                      );
                    },
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Home button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.home, color: Colors.white),
                  label: const Text(
                    'Home',
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
