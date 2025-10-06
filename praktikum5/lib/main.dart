import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daftar Berita',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          elevation: 2,
          centerTitle: true,
        ),
      ),
      home: NewsListPage(),
    );
  }
}

class NewsListPage extends StatelessWidget {
  
  final List<Map<String, String>> newsList = [
    {
      "title": "AI Generatif Mengubah Dunia Kerja di 2025",
      "subtitle": "Teknologi AI kini mampu menciptakan konten kreatif seperti teks, gambar, dan video secara otomatis.",
      "image": "https://images.unsplash.com/photo-1677442136019-21780ecad995?w=200&h=200&fit=crop"
    },
    {
      "title": "Wajib Isi Aplikasi All Indonesia Mulai September",
      "subtitle": "Pelaku perjalanan dari luar negeri diwajibkan mengisi deklarasi kedatangan di aplikasi All Indonesia.",
      "image": "https://images.unsplash.com/photo-1436491865332-7a61a109cc05?w=200&h=200&fit=crop"
    },
    {
      "title": "Timnas Indonesia Berlaga di FIFA Matchday",
      "subtitle": "Skuad Garuda siap memainkan dua laga kandang penting yang disiarkan langsung di SCTV dan Indosiar.",
      "image": "https://images.unsplash.com/photo-1579952363873-27f3bade9f55?w=200&h=200&fit=crop"
    },
    {
      "title": "Komputasi Kuantum Makin Dekat dengan Kenyataan",
      "subtitle": "Teknologi komputasi kuantum diprediksi akan merevolusi industri teknologi informasi di tahun 2025.",
      "image": "https://images.unsplash.com/photo-1635070041078-e363dbe005cb?w=200&h=200&fit=crop"
    },
    {
      "title": "Energi Terbarukan Berbasis AI Meningkat",
      "subtitle": "Teknologi AI digunakan untuk mengoptimalkan turbin angin dan panel surya demi keberlanjutan lingkungan.",
      "image": "https://images.unsplash.com/photo-1509391366360-2e959784a276?w=200&h=200&fit=crop"
    },
    {
      "title": "Virtual Reality dan AR Jadi Tren Teknologi 2025",
      "subtitle": "VR dan AR diprediksi akan mengubah cara kita bekerja, belajar, dan berhibur di masa depan.",
      "image": "https://images.unsplash.com/photo-1592478411213-6153e4ebc07d?w=200&h=200&fit=crop"
    },
    {
      "title": "Smartphone 5G Makin Terjangkau di Indonesia",
      "subtitle": "Berbagai vendor meluncurkan HP 12 GB RAM dengan harga murah untuk multitasking lancar tanpa lag.",
      "image": "https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=200&h=200&fit=crop"
    },
    {
      "title": "Keamanan Siber Semakin Ketat di Era Digital",
      "subtitle": "Perusahaan teknologi meningkatkan sistem keamanan untuk melindungi data pengguna dari ancaman cyber.",
      "image": "https://images.unsplash.com/photo-1550751827-4bd374c3f58b?w=200&h=200&fit=crop"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Daftar Berita",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Fitur pencarian")),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: newsList.length,
        padding: EdgeInsets.symmetric(vertical: 8),
        itemBuilder: (context, index) {
          final news = newsList[index];
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.all(12),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  news["image"]!,
                  width: 70,
                  height: 70,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 70,
                      height: 70,
                      color: Colors.grey[300],
                      child: Icon(Icons.image_not_supported),
                    );
                  },
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Container(
                      width: 70,
                      height: 70,
                      child: Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      ),
                    );
                  },
                ),
              ),
              title: Text(
                news["title"]!,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Text(
                  news["subtitle"]!,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              trailing: IconButton(
                icon: Icon(
                  Icons.bookmark_border,
                  color: Colors.blue,
                  size: 28,
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Berita disimpan ke bookmark"),
                      duration: Duration(seconds: 2),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },
              ),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Mengalihkan ke halaman berita"),
                    duration: Duration(seconds: 2),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Tambah berita baru")),
          );
        },
        child: Icon(Icons.add),
        tooltip: 'Tambah Berita',
      ),
    );
  }
}