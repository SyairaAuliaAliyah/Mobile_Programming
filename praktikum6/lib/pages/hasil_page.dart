import 'package:flutter/material.dart';

class HasilPage extends StatelessWidget {
  const HasilPage({super.key});

  @override
  Widget build(BuildContext context) {
    
    final data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FB),
      appBar: AppBar(
        title: const Text('Hasil Formulir'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Card(
              elevation: 8,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 38,
                          backgroundColor: Colors.indigo.shade100,
                          child: const Icon(
                            Icons.person,
                            size: 40,
                            color: Colors.indigo,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data['nama'],
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                data['npm'],
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Divider(),
                    const SizedBox(height: 10),
                    const Text(
                      "Data Mahasiswa",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.indigo,
                      ),
                    ),
                    const SizedBox(height: 16),

                    _buildItem(Icons.email, 'Email', data['email']),
                    _buildItem(Icons.phone, 'Nomor HP', data['hp']),
                    _buildItem(Icons.wc, 'Jenis Kelamin', data['jenisKelamin']),
                    _buildItem(Icons.home, 'Alamat', data['alamat']),
                    _buildItem(Icons.calendar_today, 'Tanggal Lahir', data['tglLahir']),
                    _buildItem(Icons.access_time, 'Jam Bimbingan', data['jamBimbingan']),
                    const SizedBox(height: 30),
                    Center(
                      child: ElevatedButton.icon(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back),
                        label: const Text('Kembali ke Formulir'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigo,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 28, vertical: 12),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildItem(IconData icon, String label, String value) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: Colors.indigo, size: 22),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.black87),
                  ),
                  Text(value),
                ],
              ),
            ),
          ],
        ),
      );
}
