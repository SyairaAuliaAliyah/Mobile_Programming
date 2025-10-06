import 'package:flutter_test/flutter_test.dart';
import 'package:praktikum5/main.dart'; // ganti sesuai nama project Anda

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    // Build app
    await tester.pumpWidget(MyApp());

    // Pastikan ada judul di AppBar
    expect(find.text('Daftar Berita'), findsOneWidget);

    // Pastikan ada salah satu judul berita tampil
    expect(find.text('Teknologi AI Semakin Berkembang'), findsOneWidget);
  });
}
