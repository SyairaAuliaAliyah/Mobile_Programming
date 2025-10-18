import 'package:flutter/material.dart';

class FormMahasiswaPage extends StatefulWidget {
  const FormMahasiswaPage({super.key});

  @override
  State<FormMahasiswaPage> createState() => _FormMahasiswaPageState();
}

class _FormMahasiswaPageState extends State<FormMahasiswaPage> {
  final _formKey = GlobalKey<FormState>();
  final cName = TextEditingController();
  final cNPM = TextEditingController();
  final cEmail = TextEditingController();
  final cAlamat = TextEditingController();
  final cHP = TextEditingController();

  String? jenisKelamin;
  DateTime? tglLahir;
  TimeOfDay? jamBimbingan;

  @override
  void dispose() {
    cName.dispose();
    cNPM.dispose();
    cEmail.dispose();
    cAlamat.dispose();
    cHP.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final res = await showDatePicker(
      context: context,
      firstDate: DateTime(2000),
      initialDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
    );
    if (res != null) setState(() => tglLahir = res);
  }

  Future<void> _pickTime() async {
    final res = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (res != null) setState(() => jamBimbingan = res);
  }

  void _simpan() {
    if (!_formKey.currentState!.validate() ||
        tglLahir == null ||
        jamBimbingan == null ||
        jenisKelamin == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Data belum lengkap')),
      );
      return;
    }

    final tglLabel =
        "${tglLahir!.day}/${tglLahir!.month}/${tglLahir!.year}";
    final jamLabel =
        "${jamBimbingan!.hour.toString().padLeft(2, '0')}:${jamBimbingan!.minute.toString().padLeft(2, '0')}";

    
    Navigator.pushNamed(
      context,
      '/hasil',
      arguments: {
        'nama': cName.text,
        'npm': cNPM.text,
        'email': cEmail.text,
        'hp': cHP.text,
        'jenisKelamin': jenisKelamin!,
        'alamat': cAlamat.text,
        'tglLahir': tglLabel,
        'jamBimbingan': jamLabel,
      },
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Formulir Mahasiswa'),
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                const Text(
                  "Isi Data Mahasiswa",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo),
                ),
                const SizedBox(height: 20),

                TextFormField(
                  controller: cName,
                  decoration: const InputDecoration(
                    labelText: 'Nama',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),
                  validator: (v) =>
                      v == null || v.isEmpty ? 'Nama harus diisi' : null,
                ),
                const SizedBox(height: 16),

                TextFormField(
                  controller: cNPM,
                  decoration: const InputDecoration(
                    labelText: 'NPM',
                    prefixIcon: Icon(Icons.confirmation_number),
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (v) =>
                      v == null || v.isEmpty ? 'NPM harus diisi' : null,
                ),
                const SizedBox(height: 16),

                TextFormField(
                  controller: cEmail,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (v) {
                    if (v == null || v.isEmpty) return 'Email harus diisi';
                    if (!v.trim().endsWith('@unsika.ac.id')) {
                      return 'Gunakan email @unsika.ac.id';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                TextFormField(
                  controller: cHP,
                  decoration: const InputDecoration(
                    labelText: 'Nomor HP',
                    prefixIcon: Icon(Icons.phone),
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (v) {
                    if (v == null || v.isEmpty) return 'Nomor HP harus diisi';
                    if (!RegExp(r'^[0-9]+$').hasMatch(v)) {
                      return 'Nomor HP hanya boleh angka';
                    }
                    if (v.length < 10) return 'Nomor HP minimal 10 digit';
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'Jenis Kelamin',
                    prefixIcon: Icon(Icons.wc),
                    border: OutlineInputBorder(),
                  ),
                  value: jenisKelamin,
                  items: const [
                    DropdownMenuItem(
                        value: 'Laki-laki', child: Text('Laki-laki')),
                    DropdownMenuItem(
                        value: 'Perempuan', child: Text('Perempuan')),
                  ],
                  onChanged: (v) => setState(() => jenisKelamin = v),
                  validator: (v) =>
                      v == null ? 'Jenis Kelamin harus dipilih' : null,
                ),
                const SizedBox(height: 16),

                TextFormField(
                  controller: cAlamat,
                  decoration: const InputDecoration(
                    labelText: 'Alamat',
                    prefixIcon: Icon(Icons.home),
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 3,
                  validator: (v) =>
                      v == null || v.isEmpty ? 'Alamat harus diisi' : null,
                ),
                const SizedBox(height: 16),

                ElevatedButton.icon(
                  onPressed: _pickDate,
                  icon: const Icon(Icons.calendar_today),
                  label: Text(tglLahir == null
                      ? 'Pilih Tanggal Lahir'
                      : '${tglLahir!.day}/${tglLahir!.month}/${tglLahir!.year}'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo.shade100,
                    foregroundColor: Colors.black87,
                  ),
                ),
                const SizedBox(height: 16),

                ElevatedButton.icon(
                  onPressed: _pickTime,
                  icon: const Icon(Icons.access_time),
                  label: Text(jamBimbingan == null
                      ? 'Pilih Jam Bimbingan'
                      : '${jamBimbingan!.hour}:${jamBimbingan!.minute.toString().padLeft(2, '0')}'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo.shade100,
                    foregroundColor: Colors.black87,
                  ),
                ),
                const SizedBox(height: 30),

                ElevatedButton.icon(
                  onPressed: _simpan,
                  icon: const Icon(Icons.save),
                  label: const Text('Simpan & Lihat Hasil'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 14),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
