import 'package:flutter/material.dart';
import 'kucing.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: KucingPage(),
    );
  }
}

class KucingPage extends StatefulWidget {
  const KucingPage({super.key});

  @override
  State<KucingPage> createState() => _KucingPageState();
}

class _KucingPageState extends State<KucingPage> {
  final Kucing kucing = Kucing('Mimi', 4.5, 'Coklat');

  void tambahBerat() {
    setState(() {
      kucing.makan(1.0); 
    });
  }

  void kurangiBerat() {
    setState(() {
      kucing.lari(0.5); 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Latihan Hewan')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Nama: ${kucing.nama}', style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 10),
            Text('Berat: ${kucing.berat.toStringAsFixed(1)} kg',
                style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: tambahBerat,
              child: const Text('Makan (+1 kg)'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: kurangiBerat,
              child: const Text('Lari (-0.5 kg)'),
            ),
          ],
        ),
      ),
    );
  }
}