import 'package:flutter/material.dart';
// Mengimpor pustaka Flutter untuk membangun antarmuka pengguna.

import 'package:projekperpustakaan/pages/login_page.dart';
// Mengimpor halaman login dari proyek perpustakaan.

class SplashPage extends StatefulWidget {
  // Membuat widget Stateful untuk halaman splash.
  const SplashPage({super.key});
  // Konstruktor dengan key opsional.

  @override
  State<SplashPage> createState() => _SplashPageState();
// Menentukan State untuk widget ini.
}

class _SplashPageState extends State<SplashPage> {
  // Kelas State untuk mengatur logika dan tampilan SplashPage.

  @override
  void initState() {
    // Fungsi yang dipanggil saat pertama kali widget ini diinisialisasi.
    super.initState();
    // Memanggil inisialisasi State induk.

    // Menunda selama 5 detik sebelum navigasi ke halaman login.
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        // Mengganti halaman saat ini dengan halaman login.
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
        // Membuat rute ke halaman login.
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // Fungsi untuk membangun antarmuka pengguna.
    return Scaffold(
      body: Container(
        // Kontainer utama dengan lebar penuh layar.
        width: double.infinity,
        decoration: const BoxDecoration(
          // Dekorasi dengan gradasi warna untuk latar belakang.
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(244, 226, 242, 1.0),
              // Warna gradasi pertama.
              Color.fromRGBO(244, 226, 242, 1.0),
              // Warna gradasi kedua.
            ],
            begin: Alignment.topLeft,
            // Mulai gradasi dari sudut kiri atas.
            end: Alignment.bottomRight,
            // Akhiri gradasi di sudut kanan bawah.
          ),
        ),
        child: Center(
          // Pusatkan widget anak di tengah layar.
          child: Container(
            width: 350, // Ukuran logo
            height: 350,
            // Ukuran kontainer logo.
            decoration: const BoxDecoration(
              // Dekorasi untuk logo.
              image: DecorationImage(
                image: AssetImage("assets/image/logo.png"),
                // Menampilkan gambar logo dari folder assets.
                fit: BoxFit.contain,
                // Menyesuaikan gambar agar sesuai dalam kontainer.
              ),
            ),
          ),
        ),
      ),
    );
  }
}