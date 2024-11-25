import 'package:flutter/material.dart';
import 'package:projek_perpustakaan/pages/login_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          // Navigasi ke halaman login saat halaman splash diklik
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginPage(), // Pastikan LoginPage ada
            ),
          );
        },
        child: Container(
          width: double.infinity,
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
          child: Center(
            child: Container(
              width: 350,
              height: 350,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/image/logo.png"),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}