import 'package:flutter/material.dart';
import 'package:projek_perpustakaan/pages/dashboard.dart';
import 'package:projek_perpustakaan/pages/register_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea( // Menghindari konten terpotong oleh status bar atau navigasi.
        child: Container(
          width: double.infinity,
          height: double.infinity, // Memastikan container mengisi layar penuh.
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(244, 226, 242, 1.0), // Warna gradien
                Color.fromRGBO(244, 226, 242, 1.0), // Sama jika ingin satu warna
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: SingleChildScrollView( // Agar konten bisa di-scroll jika melebihi layar.
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Agar konten berada di tengah
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 80), // Memberi jarak atas agar logo tidak terlalu ke atas
                // Gambar logo
                Container(
                  width: 250,
                  height: 250,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/image/logo.png"),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // TextField untuk Username
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "Username",
                      labelStyle: TextStyle(
                        fontSize: 14,
                        color: const Color.fromRGBO(15, 0, 143, 1.0), // Warna label kustom
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 10,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 14,
                      color: const Color.fromRGBO(15, 53, 143, 1.0), // Warna teks input kustom
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                // TextField untuk Password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle: TextStyle(
                        fontSize: 14,
                        color: const Color.fromRGBO(15, 53, 143, 1.0), // Warna label kustom
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 10,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 14,
                      color: const Color.fromRGBO(15, 53, 143, 1.0), // Warna teks input kustom
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Tombol Login
                ElevatedButton(
                  onPressed: () {
                    // Aksi login
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DashboardPage(), // Pastikan ini adalah nama yang benar
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(221, 229, 255, 1.0), // Warna tombol
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 10,
                    ),
                  ),
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 14,
                      color: const Color.fromRGBO(15, 53, 143, 1.0), // Warna teks tombol kustom
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Link untuk daftar
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Tidak ada akun? "),
                    GestureDetector(
                      onTap: () {
                        // Navigasi ke halaman daftar
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterPage(),
                          ),
                        );
                      },
                      child: const Text(
                        "Klik Disini",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
