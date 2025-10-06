import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/laporan_page.dart';
import 'pages/panduan_page.dart';
import 'pages/kontak_page.dart';

void main() {
  runApp(const LayananMasyarakatApp());
}

class LayananMasyarakatApp extends StatelessWidget {
  const LayananMasyarakatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Layanan Masyarakat',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        useMaterial3: true,
      ),
      home: const BottomNavPage(),
    );
  }
}

class BottomNavPage extends StatefulWidget {
  const BottomNavPage({super.key});

  @override
  State<BottomNavPage> createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    FormLaporanPage(),
    PanduanPage(),
    KontakPage(),
  ];

  final List<String> _titles = [
    "Beranda",
    "Laporan",
    "Panduan",
    "Kontak",
  ];

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedIndex]),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Beranda"),
          BottomNavigationBarItem(icon: Icon(Icons.report), label: "Laporan"),
          BottomNavigationBarItem(
              icon: Icon(Icons.recycling), label: "Panduan"),
          BottomNavigationBarItem(icon: Icon(Icons.phone), label: "Kontak"),
        ],
      ),
    );
  }
}
