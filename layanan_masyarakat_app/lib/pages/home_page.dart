import 'package:flutter/material.dart';
import 'kerja_bakti_page.dart';
import 'posyandu_page.dart';
import 'ronda_page.dart';
import 'iuran_sampah_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Map<String, String>> kegiatan = const [
    {
      "judul": "Kerja Bakti Mingguan",
      "sub": "Membersihkan lingkungan bersama setiap hari Minggu pagi.",
      "gambar":
          "https://media.istockphoto.com/id/1582631746/vector/people-clean.jpg?s=612x612&w=0&k=20&c=rxPjyTOyiwqdJCEwP7LIQU9HxXe--3B2tAxYt2PTOjw=",
      "waktu": "Minggu, 07.00 WIB"
    },
    {
      "judul": "Posyandu Balita",
      "sub": "Pelayanan kesehatan ibu dan anak di balai warga RT 05.",
      "gambar":
          "https://www.shutterstock.com/shutterstock/photos/2343797241/display_1500/stock-vector--the-process-of-weighing-children-at-the-indonesian-posyandu-2343797241.jpg",
      "waktu": "Setiap tanggal 10"
    },
    {
      "judul": "Ronda Malam",
      "sub": "Kegiatan menjaga keamanan lingkungan warga secara bergilir.",
      "gambar":
          "https://tse3.mm.bing.net/th/id/OIP.ThctPa4GULu5AUIs6KQAHQAAAA?cb=12&rs=1&pid=ImgDetMain&o=7&rm=3",
      "waktu": "Setiap malam, 22.00 WIB"
    },
    {
      "judul": "Iuran Sampah Rumah Tangga",
      "sub": "Pembayaran rutin untuk pengelolaan sampah rumah tangga warga.",
      "gambar":
          "https://askarahouse.com/wp-content/uploads/2023/05/3794722.jpg",
      "waktu": "Setiap tanggal 5"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SizedBox(height: 10),

          // --- Header ---
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.circular(16),
              image: const DecorationImage(
                image: NetworkImage(
                    "https://img.pikbest.com/wp/202345/tips-design-website-ecom-company_9589166.jpg!bw700"),
                fit: BoxFit.cover,
                opacity: 0.2,
              ),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Selamat Datang 👋",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    height: 1.3,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "Sistem Informasi Layanan Masyarakat & Manajemen Sampah",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 13.5,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 22),

          // --- Info Ringkas ---
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1.0,
            children: [
              _infoCard(Icons.people, "Jumlah Warga", "134"),
              _infoCard(Icons.recycling, "Sampah Terkumpul", "278 kg"),
              _infoCard(Icons.house, "Bank Sampah Aktif", "5 Lokasi"),
            ],
          ),

          const SizedBox(height: 26),

          // --- Kegiatan Warga ---
          const Text(
            "Kegiatan Warga",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
              letterSpacing: 0.3,
            ),
          ),
          const SizedBox(height: 10),

          ...kegiatan.map((item) {
            return InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () {
                Widget page;
                switch (item['judul']) {
                  case "Kerja Bakti Mingguan":
                    page = const KerjaBaktiPage();
                    break;
                  case "Posyandu Balita":
                    page = const PosyanduPage();
                    break;
                  case "Ronda Malam":
                    page = const RondaPage();
                    break;
                  case "Iuran Sampah Rumah Tangga":
                    page = const IuranSampahPage();
                    break;
                  default:
                    page = const Scaffold(
                      body: Center(child: Text("Halaman belum tersedia")),
                    );
                }

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => page),
                );
              },
              child: Card(
                margin: const EdgeInsets.only(bottom: 14),
                elevation: 2.5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          item['gambar']!,
                          width: 68,
                          height: 68,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['judul']!,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              item['sub']!,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12.5,
                                height: 1.3,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                const Icon(Icons.access_time,
                                    color: Colors.teal, size: 15),
                                const SizedBox(width: 4),
                                Text(
                                  item['waktu']!,
                                  style: const TextStyle(
                                    fontSize: 11.5,
                                    color: Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),

          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _infoCard(IconData icon, String title, String value) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.teal.withOpacity(0.07),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.teal, size: 26),
          const SizedBox(height: 6),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14.5,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 11.5,
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}
