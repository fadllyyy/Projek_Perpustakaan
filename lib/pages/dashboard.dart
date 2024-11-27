import 'package:flutter/material.dart';
import 'profile_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;

  // Warna kustom untuk background
  final Color backgroundColor = const Color.fromRGBO(244, 226, 242, 1.0);
  final Color customTextColor = const Color.fromRGBO(15, 53, 143, 1.0); // Warna kustom untuk teks

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _navigateToProfilePage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ProfilePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/image/logo.png', // Ganti dengan path logo Anda
              width: 80, // Ukuran logo
              height: 80, // Ukuran logo
            ),
            const SizedBox(width: 32), // Memberikan jarak antara logo dan teks
            Text(
              'Dashboard',
              style: TextStyle(
                color: Color.fromRGBO(15, 53, 143, 1.0), // Warna teks kustom
                fontSize: 20, // Ukuran font
                // Menebalkan teks
              ),
            ),
          ],
        ),
        backgroundColor: backgroundColor,
        automaticallyImplyLeading: false, // Menghapus tombol back
        actions: [
          GestureDetector(
            onTap: _navigateToProfilePage, // Navigasi ke halaman profil
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/image/pnl.png'), // Path foto profil
                radius: 20, // Ukuran foto profil
              ),
            ),
          ),
        ],
        iconTheme: const IconThemeData(color: Colors.black),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0), // Tinggi garis
          child: Container(
            color: const Color.fromRGBO(15, 53, 143, 1.0), // Warna custom untuk garis
            height: 2, // Ketebalan garis
          ),
        ),
      ),
      body: SingleChildScrollView(  // Membungkus seluruh body dengan SingleChildScrollView
        child: Container(
          color: backgroundColor, // Background warna kustom
          child: Column(  // Menggunakan Column di dalam SingleChildScrollView
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Added "Terbaru" and "Buku yang Baru Dirilis"
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Terbaru', // First text
                      style: TextStyle(
                        fontSize: 18, // Larger font size for "Terbaru"
                        fontWeight: FontWeight.bold, // Bold text
                        color: customTextColor, // Custom text color
                      ),
                    ),
                    const SizedBox(height: 4), // Small gap between texts
                    Text(
                      'Buku yang Baru Dirilis', // Second text
                      style: TextStyle(
                        fontSize: 14, // Smaller font size for the second line
                        color: Colors.black, // Grey color for the second line
                      ),
                    ),
                  ],
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(10),
                itemCount: 3,
                itemBuilder: (context, rowIndex) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10), // Mengurangi jarak antar baris
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 160,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              int bookIndex = rowIndex * 5 + index;
                              return Padding(
                                padding: const EdgeInsets.only(right: 6), // Mengurangi jarak antar gambar
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        'assets/image/buku/book_cover_$bookIndex.png',
                                        fit: BoxFit.contain,
                                        width: 90, // Ukuran gambar sedikit lebih kecil
                                        height: 120,
                                        errorBuilder: (context, error, stackTrace) {
                                          return const Center(
                                            child: Icon(
                                              Icons.broken_image,
                                              size: 50,
                                              color: Colors.grey,
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              )

            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.grey[200],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(0, Icons.home),
            _buildNavItem(1, Icons.search),
            _buildNavItem(2, Icons.library_books),
            _buildNavItem(3, Icons.timer),
            _buildNavItem(4, Icons.notifications),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon) {
    final isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Container(
        width: 50, // Area yang lebih besar untuk sentuhan
        height: 50, // Area yang lebih besar untuk sentuhan
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50), // Sudut membulat
          color: isSelected ? Colors.pink.withOpacity(0.2) : Colors.transparent, // Highlight saat dipilih
        ),
        child: Center(
          child: Icon(
            icon,
            color: isSelected ? Colors.black : Colors.grey,
            size: 25, // Ukuran ikon
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: DashboardPage(),
  ));
}
