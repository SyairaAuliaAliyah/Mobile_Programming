import 'package:flutter/material.dart';

class PosyanduPage extends StatefulWidget {
  const PosyanduPage({super.key});

  @override
  State<PosyanduPage> createState() => _PosyanduPageState();
}

class _PosyanduPageState extends State<PosyanduPage> {
  final _formKey = GlobalKey<FormState>();
  String? namaAnak;
  String? namaIbu;

  @override
  Widget build(BuildContext context) {
    final List<String> bidan = ["Bidan Siti", "Bidan Rina", "Bidan Dewi"];

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text("Posyandu Balita"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Gambar header
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              "https://www.shutterstock.com/shutterstock/photos/2343797241/display_1500/stock-vector--the-process-of-weighing-children-at-the-indonesian-posyandu-2343797241.jpg",
              height: 180,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(height: 16),

          // Jadwal Posyandu
          const Text(
            "Jadwal Posyandu",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            "Setiap tanggal 10 di Balai Warga RT 05 pukul 08.00 WIB.",
            style: TextStyle(color: Colors.grey, fontSize: 13.5),
          ),

          const Divider(height: 30),

          // Daftar Bidan
          const Text(
            "Daftar Bidan",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
          const SizedBox(height: 8),
          ...bidan.map(
            (nama) => Card(
              elevation: 2,
              margin: const EdgeInsets.symmetric(vertical: 4),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: const Icon(Icons.local_hospital, color: Colors.teal),
                title: Text(
                  nama,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                subtitle: const Text(
                  "Bidan Desa RT 05",
                  style: TextStyle(fontSize: 13),
                ),
              ),
            ),
          ),

          const Divider(height: 30),

          // Form Pendaftaran
          const Text(
            "Pendaftaran Anak",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
          const SizedBox(height: 12),

          Form(
            key: _formKey,
            child: Column(
              children: [
                // Nama anak
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Nama Anak",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) =>
                      value == null || value.isEmpty ? "Nama anak wajib diisi" : null,
                  onSaved: (value) => namaAnak = value,
                ),
                const SizedBox(height: 14),

                // Nama ibu
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Nama Ibu",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) =>
                      value == null || value.isEmpty ? "Nama ibu wajib diisi" : null,
                  onSaved: (value) => namaIbu = value,
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Tombol daftar
          ElevatedButton.icon(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      "Anak $namaAnak (Ibu: $namaIbu) berhasil didaftarkan!",
                    ),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              }
            },
            icon: const Icon(Icons.check),
            label: const Text("Daftar Sekarang"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              textStyle: const TextStyle(fontSize: 15),
            ),
          ),

          const SizedBox(height: 10),

          // Tombol ambil antrian
          ElevatedButton.icon(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Nomor Antrian Anda: 07"),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
            icon: const Icon(Icons.confirmation_number_outlined),
            label: const Text("Ambil Antrian"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange[700],
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              textStyle: const TextStyle(fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
