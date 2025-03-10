import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              width: 80,
              height: 80,
              child: Image.asset(
                'assets/images/LOGO.png', // Path to your loading image
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            const Text('SENYA', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pushNamed(context, '/login'),
            child: const Text('Log In'),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/landing_image.png',
                height: 200,
              ),
              const SizedBox(height: 24),
              const Text(
                'Learn FSL in a fun and interactive way with SENYA',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/signup'),
                child: const Text('Get Started'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}