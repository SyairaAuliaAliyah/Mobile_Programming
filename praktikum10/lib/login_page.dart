import 'package:flutter/material.dart';
import '../database/db_helper.dart';
import '../model/user.dart';
import '../session_manager.dart';
import 'home_page.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  void _login() async {
    User? user = await DBHelper.instance.login(_username.text, _password.text);

    if (user != null) {
      await SessionManager.saveUser(_username.text);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomePage()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Username / Password salah")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login"), centerTitle: true),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(25),
          width: 330,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
          ),

          child: Column(mainAxisSize: MainAxisSize.min, children: [
            const Text("Masuk Akun",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),

            const SizedBox(height: 20),
            TextField(controller: _username, decoration: const InputDecoration(labelText: "Username")),
            const SizedBox(height: 12),
            TextField(controller: _password, obscureText: true, decoration: const InputDecoration(labelText: "Password")),

            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 45)),
              child: const Text("Login"),
            ),

            TextButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const RegisterPage())),
              child: const Text("Belum punya akun? Daftar"),
            )
          ]),
        ),
      ),
    );
  }
}
