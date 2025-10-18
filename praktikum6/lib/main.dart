import 'package:flutter/material.dart';
import 'pages/form_page.dart';
import 'pages/hasil_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Formulir Mahasiswa',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          useMaterial3: true,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const FormMahasiswaPage(),
          '/hasil': (context) => const HasilPage(),
        },
      );
}
