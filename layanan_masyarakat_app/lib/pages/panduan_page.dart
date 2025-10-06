import 'package:flutter/material.dart';

class PanduanPage extends StatelessWidget {
  const PanduanPage({super.key});

  final List<Map<String, String>> panduan = const [
    {
      "judul": "Sampah Organik",
      "gambar":
          "https://imgv2-2-f.scribdassets.com/img/document/644542759/original/ff7dbc0020/1683957836?v=1",
      "deskripsi":
          "Sampah organik berasal dari bahan alami yang mudah terurai seperti daun, sisa makanan, dan buah busuk. Dapat dijadikan kompos untuk pupuk tanaman.",
      "detail":
          "Contoh sampah organik:\n- Daun kering\n- Sisa nasi dan sayur\n- Kulit buah\n\nManfaat pemilahan:\n✅ Mengurangi volume sampah\n✅ Dapat dijadikan pupuk alami\n\nTempat pembuangan: Tempat sampah berwarna hijau."
    },
    {
      "judul": "Sampah Anorganik",
      "gambar":
          "https://down-id.img.susercontent.com/file/id-11134207-7r98r-lr00pt9mr6bxa3",
      "deskripsi":
          "Sampah yang sulit terurai seperti plastik, botol, logam, dan kaca. Dapat didaur ulang untuk digunakan kembali.",
      "detail":
          "Contoh sampah anorganik:\n- Plastik bekas\n- Botol minuman\n- Logam dan kaleng\n\nManfaat pemilahan:\n✅ Mengurangi polusi tanah\n✅ Dapat dijual untuk didaur ulang\n\nTempat pembuangan: Tempat sampah berwarna kuning."
    },
    {
      "judul": "Sampah B3 (Berbahaya dan Beracun)",
      "gambar":
          "https://down-id.img.susercontent.com/file/17ee809a1b822dea63b582cfb6f49da5",
      "deskripsi":
          "Jenis sampah berbahaya seperti baterai, obat kadaluarsa, dan lampu bekas. Harus dibuang di tempat khusus.",
      "detail":
          "Contoh sampah B3:\n- Baterai bekas\n- Lampu neon\n- Obat kedaluwarsa\n\nManfaat pemilahan:\n✅ Mencegah pencemaran air dan tanah\n✅ Melindungi kesehatan warga\n\nTempat pembuangan: Kontainer khusus B3 milik dinas lingkungan."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: panduan.length,
        itemBuilder: (context, index) {
          final item = panduan[index];
          return InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: Text(item['judul']!),
                  content: SingleChildScrollView(
                    child: Text(item['detail']!),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Tutup"),
                    )
                  ],
                ),
              );
            },
            child: Card(
              margin: const EdgeInsets.only(bottom: 16),
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        item['gambar']!,
                        width: 80,
                        height: 80,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['judul']!,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            item['deskripsi']!,
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
