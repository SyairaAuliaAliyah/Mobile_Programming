import 'package:flutter/material.dart';

class RondaPage extends StatelessWidget {
  const RondaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> jadwal = [
      {"nama": "Pak Budi", "lokasi": "Pos Kamling Blok A"},
      {"nama": "Pak Dedi", "lokasi": "Depan Mushola"},
      {"nama": "Pak Agus", "lokasi": "Blok C Barat"},
    ];

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text("Ronda Malam"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              "https://tse3.mm.bing.net/th/id/OIP.ThctPa4GULu5AUIs6KQAHQAAAA?cb=12&rs=1&pid=ImgDetMain&o=7&rm=3",
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            "👮 Jadwal Petugas Ronda",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          ...jadwal.map((item) => Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  leading: const Icon(Icons.shield_moon, color: Colors.teal),
                  title: Text(item["nama"]!),
                  subtitle: Text(item["lokasi"]!),
                ),
              )),
          const Divider(height: 30),
          const Text(
            "📍 Lokasi Patroli",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "Patroli dilakukan di seluruh area RT 05 mulai pukul 22.00 WIB hingga 04.00 WIB.",
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Kehadiran ronda malam telah dikonfirmasi!")),
              );
            },
            icon: const Icon(Icons.done_all),
            label: const Text("Konfirmasi Kehadiran"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            ),
          ),
        ],
      ),
    );
  }
}
