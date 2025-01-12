import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  // Fungsi untuk navigasi ke halaman profil
  void _navigateToProfilePage(BuildContext context) {
    Navigator.pushNamed(context, '/profile');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar bagian atas halaman
      appBar: AppBar(
        title: Row(
          children: [
            // Logo aplikasi
            Image.asset(
              'assets/image/logo polos.png',
              width: 75,
              height: 75,
            ),
            const SizedBox(width: 32),
            // Teks judul "Notifikasi"
            Text(
              'Notifikasi',
              style: TextStyle(
                color: Color.fromRGBO(15, 53, 143, 1.0),
                fontSize: 20,
              ),
            ),
          ],
        ),
        backgroundColor: const Color.fromRGBO(244, 226, 242, 1.0), // Warna latar AppBar
        automaticallyImplyLeading: false, // Menyembunyikan tombol back
        actions: [
          // Icon profile di pojok kanan atas
          GestureDetector(
            onTap: () => _navigateToProfilePage(context),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/image/profile.png'),
                radius: 20,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        color: const Color.fromRGBO(244, 226, 242, 1.0), // Warna latar halaman
        child: Column(
          children: [
            // Garis pemisah di bawah AppBar
            Container(
              height: 1, // Ketebalan garis
              color: const Color.fromRGBO(15, 53, 143, 1.0), // Warna garis biru dongker
            ),
            const SizedBox(height: 16), // Jarak antara garis dan notifikasi

            // Daftar notifikasi
            Expanded(
              child: ListView(
                children: [
                  _buildNotificationRow(
                    'assets/image/logo polos.png',
                    'Hai Devi Marlinda! Pemberitahuan Pemimjaman Buku: Buku Anda sudah tersedia, silakan dibaca!',
                  ),
                  _buildNotificationRow(
                    'assets/image/logo polos.png',
                    'Pemberitahuan Pemimjaman Buku: Buku Anda harus dikembalikan dalam 3 hari!',
                  ),
                  _buildNotificationRow(
                    'assets/image/logo polos.png',
                    'Pemberitahuan Pemimjaman Buku: Pengembalian buku terlambat!',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // Navigasi bawah (Bottom Navigation Bar)
      bottomNavigationBar: Container(
        color: Colors.grey[200], // Warna latar navigasi bawah
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround, // Menyebarkan item navigasi secara rata
          children: [
            _buildNavItem(context, 0, Icons.home),
            _buildNavItem(context, 1, Icons.search),
            _buildNavItem(context, 2, Icons.library_books),
            _buildNavItem(context, 3, Icons.timer),
            _buildNavItem(context, 4, Icons.notifications),
          ],
        ),
      ),
    );
  }

  // Widget untuk menampilkan satu baris notifikasi
  Widget _buildNotificationRow(String imagePath, String notificationText) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16), // Jarak antara notifikasi
      padding: const EdgeInsets.all(12), // Jarak di dalam container
      decoration: BoxDecoration(
        color: const Color.fromRGBO(241, 206, 236, 1.0), // Warna latar belakang notifikasi
      ),
      child: Row(
        children: [
          // Gambar di sebelah kiri
          ClipRRect(
            borderRadius: BorderRadius.circular(8), // Sudut gambar melengkung
            child: Image.asset(
              imagePath,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16), // Jarak antara gambar dan teks
          // Teks notifikasi
          Expanded(
            child: Text(
              notificationText,
              style: TextStyle(
                fontSize: 16,
                color: Color.fromRGBO(15, 53, 143, 1.0), // Warna teks
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget untuk item navigasi di bawah
  Widget _buildNavItem(BuildContext context, int index, IconData icon) {
    final isSelected = ModalRoute.of(context)?.settings.name == '/notification' && index == 4;
    return GestureDetector(
      onTap: () {
        // Navigasi berdasarkan indeks
        if (index == 0) Navigator.pushNamed(context, '/dashboard');
        if (index == 1) Navigator.pushNamed(context, '/search');
        if (index == 2) Navigator.pushNamed(context, '/borrow');
        if (index == 3) Navigator.pushNamed(context, '/history');
        if (index == 4) Navigator.pushNamed(context, '/notification');
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50), // Membuat lingkaran untuk item
          color: isSelected ? Colors.pink.withOpacity(0.2) : Colors.transparent, // Warna saat dipilih
        ),
        child: Center(
          child: Icon(
            icon,
            color: isSelected ? Colors.black : Colors.grey, // Warna ikon
            size: 25,
          ),
        ),
      ),
    );
  }
}
