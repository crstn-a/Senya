import 'package:flutter/material.dart';
import '../repositories/auth_repository.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ✅ Expecting a Map<String, dynamic> instead of User
    final Map<String, dynamic>? userProfile =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome, ${userProfile?['name'] ?? 'User'}"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              final AuthRepository authRepository = AuthRepository();
              await authRepository.logout();
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
      body: Center(
        child: Text("Email: ${userProfile?['email'] ?? 'No Email'}"),
      ),
    );
  }
}
