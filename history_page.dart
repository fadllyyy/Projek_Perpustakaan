import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  // Fungsi untuk navigasi ke halaman profile
  void _navigateToProfilePage(BuildContext context) {
    Navigator.pushNamed(context, '/profile');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar dengan logo dan judul
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/image/logo polos.png', // Gambar logo
              width: 75,
              height: 75,
            ),
            const SizedBox(width: 32), // Jarak antara logo dan judul
            Text(
              'Riwayat Peminjaman',
              style: TextStyle(
                color: Color.fromRGBO(15, 53, 143, 1.0), // Warna teks judul
                fontSize: 30,
              ),
            ),
          ],
        ),
        backgroundColor: const Color.fromRGBO(244, 226, 242, 1.0), // Warna background AppBar yang tetap
        automaticallyImplyLeading: false, // Tidak menampilkan tombol back
        actions: [
          // Tombol untuk menuju halaman profile
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

      // Body utama halaman
      body: Container(
        color: const Color.fromRGBO(244, 226, 242, 1.0), // Warna latar belakang halaman
        child: Column(
          children: [
            // Divider sebagai garis pemisah di atas
            const Divider(
              color: Colors.blueGrey, // Warna biru gelap
              height: 1,
              thickness: 2, // Ketebalan divider
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16.0), // Padding list
                itemCount: 1, // Menampilkan satu riwayat peminjaman
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Column(
                        children: [
                          ListTile(
                            // Gambar di sebelah kiri
                            leading: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.lightBlue.withOpacity(0.3), // Warna latar belakang gambar
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Image.asset(
                                'assets/image/notifpage/notif.png', // Gambar notifikasi
                                width: 60,
                                height: 65,
                                fit: BoxFit.cover,
                              ),
                            ),
                            // Judul buku
                            title: Text(
                              'CINTA',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(15, 53, 143, 1.0), // Warna judul
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Tanggal peminjaman
                                Text(
                                  'Tanggal Peminjaman: 2023-12-01',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[600], // Warna teks
                                  ),
                                ),
                                // Tanggal pengembalian
                                Text(
                                  'Tanggal Pengembalian: 2023-12-15',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[600], // Warna teks
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

      // Bottom navigation bar
      bottomNavigationBar: Container(
        color: Colors.grey[200], // Warna latar belakang bottom navigation
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround, // Menyebar item secara merata
          children: [
            // Membuat item navigation
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

  // Fungsi untuk membuat item di bottom navigation
  Widget _buildNavItem(BuildContext context, int index, IconData icon) {
    // Menentukan apakah item terpilih
    final isSelected = ModalRoute.of(context)?.settings.name == '/history' && index == 3;

    return GestureDetector(
      onTap: () {
        // Navigasi berdasarkan index
        if (index == 0) {
          Navigator.pushNamed(context, '/dashboard');
        } else if (index == 1) {
          Navigator.pushNamed(context, '/search');
        } else if (index == 2) {
          Navigator.pushNamed(context, '/borrow');
        } else if (index == 3) {
          Navigator.pushNamed(context, '/history');
        } else if (index == 4) {
          Navigator.pushNamed(context, '/notification');
        }
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50), // Membuat item berbentuk lingkaran
          color: isSelected ? Colors.pink.withOpacity(0.2) : Colors.transparent, // Warna item saat terpilih
        ),
        child: Center(
          child: Icon(
            icon, // Menampilkan ikon
            color: isSelected ? Colors.black : Colors.grey, // Warna ikon saat terpilih
            size: 25,
          ),
        ),
      ),
    );
  }
}
