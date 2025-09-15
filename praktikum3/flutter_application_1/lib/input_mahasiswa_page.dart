import 'package:flutter/material.dart';

class InputMahasiswaPage extends StatefulWidget {
  const InputMahasiswaPage({super.key});

  @override
  State<InputMahasiswaPage> createState() => _InputMahasiswaPageState();
}

class _InputMahasiswaPageState extends State<InputMahasiswaPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _umurController = TextEditingController();
  final TextEditingController _alamatController = TextEditingController();
  final TextEditingController _kontakController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Input Data Mahasiswa",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFE0B2), Color(0xFFFFCC80)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SizedBox(height: 20),
                
                // Header
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: const Column(
                    children: [
                      Text(
                        "Formulir Data Mahasiswa",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Lengkapi semua field di bawah ini",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                // Form
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.95),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _namaController,
                          decoration: const InputDecoration(
                            labelText: "Nama Lengkap",
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(12)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(12)),
                              borderSide: BorderSide(color: Colors.grey, width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(12)),
                              borderSide: BorderSide(color: Colors.orange, width: 2),
                            ),
                          ),
                          validator: (value) =>
                              value == null || value.isEmpty ? "Nama tidak boleh kosong" : null,
                        ),
                        const SizedBox(height: 20),
                        
                        TextFormField(
                          controller: _umurController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: "Umur",
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(12)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(12)),
                              borderSide: BorderSide(color: Colors.grey, width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(12)),
                              borderSide: BorderSide(color: Colors.orange, width: 2),
                            ),
                          ),
                          validator: (value) =>
                              value == null || value.isEmpty ? "Umur tidak boleh kosong" : null,
                        ),
                        const SizedBox(height: 20),
                        
                        TextFormField(
                          controller: _alamatController,
                          maxLines: 3,
                          decoration: const InputDecoration(
                            labelText: "Alamat",
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(12)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(12)),
                              borderSide: BorderSide(color: Colors.grey, width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(12)),
                              borderSide: BorderSide(color: Colors.orange, width: 2),
                            ),
                          ),
                          validator: (value) =>
                              value == null || value.isEmpty ? "Alamat tidak boleh kosong" : null,
                        ),
                        const SizedBox(height: 20),
                        
                        TextFormField(
                          controller: _kontakController,
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            labelText: "Nomor Kontak",
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(12)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(12)),
                              borderSide: BorderSide(color: Colors.grey, width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(12)),
                              borderSide: BorderSide(color: Colors.orange, width: 2),
                            ),
                          ),
                          validator: (value) =>
                              value == null || value.isEmpty ? "Kontak tidak boleh kosong" : null,
                        ),
                        const SizedBox(height: 30),
                        
                        // Save Button
                        Container(
                          width: double.infinity,
                          height: 55,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepOrangeAccent,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 4,
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                final mahasiswa = {
                                  "nama": _namaController.text,
                                  "umur": _umurController.text,
                                  "alamat": _alamatController.text,
                                  "kontak": _kontakController.text,
                                };
                                Navigator.pop(context, mahasiswa);
                              }
                            },
                            child: const Text(
                              "Simpan",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _namaController.dispose();
    _umurController.dispose();
    _alamatController.dispose();
    _kontakController.dispose();
    super.dispose();
  }
}