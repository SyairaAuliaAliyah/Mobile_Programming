import 'package:flutter/material.dart';

class IuranSampahPage extends StatelessWidget {
  const IuranSampahPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Iuran Sampah Rumah Tangga"),
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      backgroundColor: Colors.grey[100],
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.network(
              "https://askarahouse.com/wp-content/uploads/2023/05/3794722.jpg",
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 16),

          const Text(
            "Jadwal Pengambilan Sampah",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 8),
          _infoBox([
            "Hari: Selasa & Jumat",
            "Waktu: 07.00 - 10.00 WIB",
            "Petugas: Tim Bank Sampah RW 05",
          ]),

          const SizedBox(height: 20),

          const Text(
            "Informasi Pembayaran",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 8),
          _infoBox([
            "Bank: BRI",
            "Atas Nama: Pengelola Sampah RT 05",
            "Nominal: Rp 25.000 / Bulan",
            "Jatuh Tempo: Tanggal 5 setiap bulan",
          ]),

          const SizedBox(height: 24),

          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(vertical: 14),
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: const Text("Pembayaran Berhasil"),
                  content: const Text(
                      "Terima kasih, pembayaran iuran sampah Anda telah diterima dan akan diverifikasi oleh pengelola."),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Tutup"),
                    )
                  ],
                ),
              );
            },
            icon: const Icon(Icons.payment_rounded),
            label: const Text(
              "Bayar Sekarang",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoBox(List<String> lines) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.teal.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: lines
            .map((line) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: Text(line),
                ))
            .toList(),
      ),
    );
  }
}
