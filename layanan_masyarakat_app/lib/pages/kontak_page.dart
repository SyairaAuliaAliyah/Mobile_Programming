import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class KontakPage extends StatelessWidget {
  const KontakPage({super.key});

  final List<Map<String, String>> kontakList = const [
    {
      "nama": "Pak Andi",
      "jabatan": "Ketua RT 05",
      "telepon": "081234567890",
      "email": "andi.rt05@gmail.com",
      "gambar": "https://img.freepik.com/premium-vector/profile-icon_933463-643.jpg"
    },
    {
      "nama": "Bu Sari",
      "jabatan": "Ketua RW 02",
      "telepon": "081987654321",
      "email": "sari.rw02@gmail.com",
      "gambar": "https://static.vecteezy.com/system/resources/previews/014/194/215/original/avatar-icon-human-a-person-s-badge-social-media-profile-symbol-the-symbol-of-a-person-vector.jpg"
    },
    {
      "nama": "Dr. Rina",
      "jabatan": "Petugas Kesehatan",
      "telepon": "081345678912",
      "email": "rina.puskesmas@gmail.com",
      "gambar": "https://cdn-icons-png.flaticon.com/512/10643/10643250.png"
    },
    {
      "nama": "Pak Budi",
      "jabatan": "Petugas Kebersihan",
      "telepon": "082134567891",
      "email": "budi.kebersihan@gmail.com",
      "gambar": "https://static.vecteezy.com/system/resources/previews/005/851/763/original/trendy-client-concepts-vector.jpg"
    },
  ];

  Future<void> _hubungiNomor(String nomor) async {
    final Uri telUri = Uri(scheme: 'tel', path: nomor);
    if (await canLaunchUrl(telUri)) {
      await launchUrl(telUri);
    } else {
      throw 'Tidak dapat membuka panggilan ke $nomor';
    }
  }

  Future<void> _kirimEmail(String email) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
      query: Uri.encodeFull('subject=Hubungi dari Aplikasi Layanan Masyarakat'),
    );
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      throw 'Tidak dapat membuka email ke $email';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      padding: const EdgeInsets.all(16),
      child: ListView.builder(
        itemCount: kontakList.length,
        itemBuilder: (context, index) {
          final item = kontakList[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            elevation: 3,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(item['gambar']!),
                    radius: 30,
                    backgroundColor: Colors.teal.shade50,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item['nama']!,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                        Text(item['jabatan']!,
                            style: const TextStyle(
                                color: Colors.teal,
                                fontWeight: FontWeight.w500)),
                        const SizedBox(height: 4),
                        Text("Telp: ${item['telepon']!}",
                            style: const TextStyle(
                                color: Colors.black87, fontSize: 13)),
                        Text("Email: ${item['email']!}",
                            style: const TextStyle(
                                color: Colors.black87, fontSize: 13)),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.phone, color: Colors.teal),
                        onPressed: () => _hubungiNomor(item['telepon']!),
                        tooltip: "Hubungi via Telepon",
                      ),
                      IconButton(
                        icon: const Icon(Icons.email, color: Colors.orange),
                        onPressed: () => _kirimEmail(item['email']!),
                        tooltip: "Kirim Email",
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
