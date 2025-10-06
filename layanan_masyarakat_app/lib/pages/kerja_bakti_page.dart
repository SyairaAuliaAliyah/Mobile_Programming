import 'package:flutter/material.dart';

class KerjaBaktiPage extends StatelessWidget {
  const KerjaBaktiPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> areaBersih = [
      {"nama": "Blok A", "kegiatan": "Membersihkan taman dan selokan"},
      {"nama": "Blok B", "kegiatan": "Mengecat pagar & pos ronda"},
      {"nama": "Blok C", "kegiatan": "Menanam pohon & menyapu jalan"},
      {"nama": "Blok D", "kegiatan": "Mengumpulkan sampah daur ulang"},
    ];

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text("Kerja Bakti Mingguan"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              "https://media.istockphoto.com/id/1582631746/vector/people-clean.jpg?s=612x612&w=0&k=20&c=rxPjyTOyiwqdJCEwP7LIQU9HxXe--3B2tAxYt2PTOjw=",
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            "📋 Daftar Area Kerja Bakti",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          ...areaBersih.map((blok) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 2,
              margin: const EdgeInsets.only(bottom: 12),
              child: ListTile(
                leading: const Icon(Icons.cleaning_services, color: Colors.teal),
                title: Text(blok['nama']!),
                subtitle: Text(blok['kegiatan']!),
              ),
            );
          }),
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Terima kasih! Anda terdaftar ikut kerja bakti."),
                  ),
                );
              },
              icon: const Icon(Icons.thumb_up),
              label: const Text("Ikut Kerja Bakti"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
