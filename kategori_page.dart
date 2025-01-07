import 'package:flutter/material.dart';

void main() {
  // Menjalankan aplikasi dengan halaman utama SearchPage
  runApp(const MaterialApp(
    home: SearchPage(),
  ));
}

// Halaman pencarian
class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  // Indeks yang menunjukkan tab yang aktif, dimulai dari pencarian (index 1)
  int _selectedIndex = 1;
  // Warna latar belakang dan teks khusus
  final Color backgroundColor = const Color.fromRGBO(244, 226, 242, 1.0);
  final Color customTextColor = const Color.fromRGBO(15, 53, 143, 1.0);

  // Controller untuk TextField pencarian
  final TextEditingController _searchController = TextEditingController();

  // Fungsi untuk mengganti indeks tab yang aktif
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Fungsi untuk menuju halaman profil (kosong di sini)
  void _navigateToProfilePage() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar bagian atas aplikasi
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/image/logo polos.png', // Gambar logo aplikasi
              width: 75,
              height: 75,
            ),
            const SizedBox(width: 32),
            // Judul halaman
            Text(
              'Kategori Buku',
              style: TextStyle(color: customTextColor, fontSize: 20),
            ),
          ],
        ),
        backgroundColor: backgroundColor, // Warna latar belakang app bar
        automaticallyImplyLeading: false, // Menonaktifkan tombol kembali
        actions: [
          // Avatar pengguna di sisi kanan
          GestureDetector(
            onTap: _navigateToProfilePage,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/image/pnl.png'),
                radius: 20,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: backgroundColor, // Latar belakang tubuh halaman
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                // Kolom input untuk pencarian
                child: TextField(
                  controller: _searchController,
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: 'Cari Buku...',
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    filled: true,
                    fillColor: Colors.purple[50], // Warna latar belakang input
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.search, color: Colors.grey),
                      onPressed: () {
                        print('Searching for: ${_searchController.text}');
                      },
                    ),
                  ),
                  onChanged: (text) {
                    // Menampilkan teks pencarian saat diketik
                    print('Searching for: $text');
                  },
                ),
              ),
              // Judul kategori buku
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Text(
                  'Kategori Buku',
                  style: TextStyle(
                    color: Color(0xFF0F358F),
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Grid untuk kategori buku
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Jumlah kolom
                    crossAxisSpacing: 20, // Jarak antar kolom
                    mainAxisSpacing: 20, // Jarak antar baris
                    childAspectRatio: 3.3, // Rasio aspek elemen grid
                  ),
                  itemCount: 16, // Jumlah kategori buku
                  shrinkWrap: true, // Mengatur agar grid sesuai dengan konten
                  physics: const NeverScrollableScrollPhysics(), // Menonaktifkan scroll pada grid
                  itemBuilder: (context, index) {
                    // Daftar kategori buku
                    final categories = [
                      "Cinta", "Jurnal", "Sejarah", "Politik",
                      "Kuliner", "Statistik", "Nonfiksi", "Ekonomi",
                      "Kamus", "Matematika", "Novel", "Pemrograman",
                      "Ensiklopedia", "Sains", "Fiksi", "Biografi",
                    ];
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: const Color(0xFF0F358F),
                        backgroundColor: const Color(0xFFBFD8FD),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
                        minimumSize: const Size(50, 50),
                      ),
                      onPressed: () {
                        if (categories[index] == "Cinta") {
                          // Jika kategori "Cinta" dipilih, navigasi ke halaman LovePage
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const LovePage()),
                          );
                        } else {
                          // Jika kategori lain, hanya cetak nama kategori
                          print('Kategori: ${categories[index]}');
                        }
                      },
                      child: Text(
                        categories[index],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      // Navigasi bawah dengan ikon
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

  // Fungsi untuk membuat item navigasi
  Widget _buildNavItem(int index, IconData icon) {
    final isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: isSelected ? Colors.pink.withOpacity(0.2) : Colors.transparent,
        ),
        child: Center(
          child: Icon(
            icon,
            color: isSelected ? Colors.black : Colors.grey,
            size: 25,
          ),
        ),
      ),
    );
  }
}

// Halaman kategori "Cinta"
class LovePage extends StatelessWidget {
  const LovePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = const Color.fromRGBO(244, 226, 242, 1.0);
    final Color textColor = const Color.fromRGBO(244, 226, 242, 1.0);

    return Scaffold(
      // AppBar untuk halaman Cinta
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.favorite, color: Colors.white, size: 30),
            const SizedBox(width: 8),
            const Text(
              'Kategori Cinta',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
        backgroundColor: textColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: backgroundColor,
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Judul buku rekomendasi
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'Rekomendasi Buku Cinta',
                  style: TextStyle(
                    color: Color(0xFFF4E2F2),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // Grid untuk buku-buku rekomendasi
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Dua kolom buku
                  crossAxisSpacing: 20, // Jarak antar kolom
                  mainAxisSpacing: 20, // Jarak antar baris
                  childAspectRatio: 0.75, // Rasio gambar dan teks
                ),
                itemCount: 8, // Jumlah buku
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final books = [
                    {"title": "Buku Cinta", "image": "assets/image/kategorilove/love.png"},
                    {"title": "Buku cinta selamanya", "image": "assets/images/kategorilove/love1.png"},
                    {"title": "Buku cinta gak mengenal logika", "image": "assets/images/kategorilove/love2.png"},
                    {"title": "Bukan sekedar cinta", "image": "assets/images/kategorilove/love3.png"},
                    {"title": "Buku E", "image": "assets/images/kategorilove/love4.png"},
                    {"title": "Buku F", "image": "assets/images/kategorilove/love5.png"},
                    {"title": "Buku G", "image": "assets/images/kategorilove/love6.png"},
                    {"title": "Buku H", "image": "assets/images/kategorilove/love7.png"},
                  ];

                  return GestureDetector(
                    onTap: () {
                      // Menampilkan detail buku saat dipilih
                      print('Membuka detail: ${books[index]["title"]}');
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 6,
                      shadowColor: Colors.black.withOpacity(0.1),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // Gambar buku dengan border
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(12),
                            ),
                            child: Image.asset(
                              books[index]["image"]!,
                              fit: BoxFit.cover,
                              height: 140, // Sesuaikan tinggi gambar
                            ),
                          ),
                          // Judul buku
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              books[index]["title"]!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
