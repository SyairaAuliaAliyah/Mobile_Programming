import 'package:flutter/material.dart';
import '../session_manager.dart';
import 'login_page.dart';
import 'profile_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home"), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Welcome 👋",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),

            const SizedBox(height: 5),
            const Text("Selamat datang!",
                style: TextStyle(fontSize: 15, color: Colors.grey)),

            const SizedBox(height: 40),

            ElevatedButton.icon(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ProfilePage())),
              icon: const Icon(Icons.person),
              label: const Text("Profile"),
              style: ElevatedButton.styleFrom(minimumSize: const Size(180, 45)),
            ),

            const SizedBox(height: 15),

            ElevatedButton.icon(
              onPressed: () async {
                await SessionManager.logout();
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LoginPage()));
              },
              icon: const Icon(Icons.logout),
              label: const Text("Logout"),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  minimumSize: const Size(180, 45)),
            )
          ],
        ),
      ),
    );
  }
}
