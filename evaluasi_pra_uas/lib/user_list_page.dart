import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class UserListPage extends StatefulWidget {
  const UserListPage({super.key});

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  final String url = "https://jsonplaceholder.typicode.com/users";
  List users = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    loadUsers();
  }

  Future<void> loadUsers() async {
    setState(() => loading = true);

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        users = jsonDecode(response.body);
      }
    } catch (e) {
      print("Error: $e");
    }

    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daftar Pengguna"),
        actions: [
          IconButton(icon: const Icon(Icons.refresh), onPressed: loadUsers),
        ],
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final u = users[index];
                return ListTile(
                  leading: CircleAvatar(child: Text(u["name"][0])),
                  title: Text(u["name"]),
                  subtitle: Text("${u["email"]}\nKota: ${u["address"]["city"]}"),
                );
              },
            ),
    );
  }
}
