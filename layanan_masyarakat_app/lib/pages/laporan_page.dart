import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FormLaporanPage extends StatefulWidget {
  const FormLaporanPage({super.key});

  @override
  State<FormLaporanPage> createState() => _FormLaporanPageState();
}

class _FormLaporanPageState extends State<FormLaporanPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _laporanController = TextEditingController();
  String? _kategori;
  List<String> laporanTersimpan = [];

  @override
  void initState() {
    super.initState();
    _loadLaporan();
  }

  Future<void> _loadLaporan() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      laporanTersimpan = prefs.getStringList('laporan') ?? [];
    });
  }

  Future<void> _simpanLaporan() async {
    if (_formKey.currentState!.validate()) {
      final prefs = await SharedPreferences.getInstance();
      final laporanBaru =
          "${_namaController.text} - ${_kategori ?? 'Umum'}: ${_laporanController.text}";
      laporanTersimpan.add(laporanBaru);
      await prefs.setStringList('laporan', laporanTersimpan);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Laporan berhasil dikirim!"),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.teal,
        ),
      );
      _namaController.clear();
      _laporanController.clear();
      setState(() => _kategori = null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar dihapus
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            const Text(
              "Form Laporan Warga",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            const SizedBox(height: 20),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _namaController,
                        decoration: const InputDecoration(
                          labelText: "Nama Lengkap",
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(),
                        ),
                        validator: (val) =>
                            val == null || val.isEmpty ? "Nama wajib diisi" : null,
                      ),
                      const SizedBox(height: 16),
                      DropdownButtonFormField<String>(
                        value: _kategori,
                        decoration: const InputDecoration(
                          labelText: "Kategori Laporan",
                          prefixIcon: Icon(Icons.category),
                          border: OutlineInputBorder(),
                        ),
                        items: const [
                          DropdownMenuItem(
                            value: "Kebersihan",
                            child: Text("Kebersihan"),
                          ),
                          DropdownMenuItem(
                            value: "Keamanan",
                            child: Text("Keamanan"),
                          ),
                          DropdownMenuItem(
                            value: "Sosial",
                            child: Text("Sosial"),
                          ),
                        ],
                        onChanged: (value) => setState(() => _kategori = value),
                        validator: (val) =>
                            val == null ? "Pilih kategori laporan" : null,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _laporanController,
                        maxLines: 3,
                        decoration: const InputDecoration(
                          labelText: "Isi Laporan",
                          prefixIcon: Icon(Icons.description),
                          border: OutlineInputBorder(),
                        ),
                        validator: (val) => val == null || val.length < 10
                            ? "Laporan minimal 10 karakter"
                            : null,
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton.icon(
                        onPressed: _simpanLaporan,
                        icon: const Icon(Icons.send, color: Colors.white),
                        label: const Text(
                          "Kirim Laporan",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal,
                          minimumSize: const Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "📋 Laporan Tersimpan:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ...laporanTersimpan.map(
              (lap) => Card(
                margin: const EdgeInsets.symmetric(vertical: 6),
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  leading: const Icon(Icons.report, color: Colors.teal),
                  title: Text(lap),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
