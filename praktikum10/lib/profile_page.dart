import 'package:flutter/material.dart';
import '../database/db_helper.dart';
import '../session_manager.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  String? currentUser;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    currentUser = await SessionManager.getUsername();
    _username.text = currentUser ?? "";
    setState(() {});
  }

  void updateProfile() async {
    final db = await DBHelper.instance.database;

    await db.update(
      "users",
      {"username": _username.text, "password": _password.text},
      where: "username = ?", whereArgs: [currentUser],
    );

    SessionManager.saveUser(_username.text);

    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Data Berhasil Diupdate ✔")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            const Text("Edit Profil", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 25),

            TextField(controller: _username, decoration: const InputDecoration(labelText: "Username")),
            const SizedBox(height: 15),
            TextField(controller: _password, decoration: const InputDecoration(labelText: "Password Baru"), obscureText: true),
            const SizedBox(height: 25),

            ElevatedButton(
              onPressed: updateProfile,
              style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 45)),
              child: const Text("Simpan"),
            )
          ],
        ),
      ),
    );
  }
}
