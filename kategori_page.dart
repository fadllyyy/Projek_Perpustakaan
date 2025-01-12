import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: SearchPage(),
  ));
}

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int _selectedIndex = 1;
  final Color backgroundColor = const Color.fromRGBO(244, 226, 242, 1.0);
  final Color customTextColor = const Color.fromRGBO(15, 53, 143, 1.0);

  final TextEditingController _searchController = TextEditingController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _navigateToProfilePage() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/image/logo polos.png',
              width: 75,
              height: 75,
            ),
            const SizedBox(width: 32),
            Text(
              'Kategori Buku',
              style: TextStyle(color: customTextColor, fontSize: 20),
            ),
          ],
        ),
        backgroundColor: backgroundColor,
        automaticallyImplyLeading: false,
        actions: [
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
          color: backgroundColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
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
                    fillColor: Colors.purple[50],
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.search, color: Colors.grey),
                      onPressed: () {
                        print('Searching for: ${_searchController.text}');
                      },
                    ),
                  ),
                  onChanged: (text) {
                    print('Searching for: $text');
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Text(
                  'Kategori Buku',
                  style: TextStyle(
                    color: Color(0xFF0F358F),
                    fontSize: 16,

                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: 3.3,
                  ),
                  itemCount: 16,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const LovePage()),
                          );
                        } else {
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


const Color globalBackgroundColor = Color.fromRGBO(244, 226, 242, 1.0);

class LovePage extends StatelessWidget {
  const LovePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF0F358F)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Row(
          children: [
            Image.asset(
              'assets/image/logo polos.png',
              width: 50,
              height: 50,
            ),
            const SizedBox(width: 8),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                'Kategori Buku Cinta',
                style: TextStyle(
                  color: Color(0xFF0F358F),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: globalBackgroundColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: globalBackgroundColor,
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0),
                child: Text(
                  'Rekomendasi Buku Cinta',
                  style: TextStyle(
                    color: Color(0xFF0F358F),
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 50,
                  mainAxisSpacing: 50,
                  childAspectRatio: 0.50,
                ),
                itemCount: 3,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final books = [
                    {
                      "title": "CINTA",
                      "description": "buku ini mencerita penuh drama dan perjuangan.",
                      "image": "assets/image/kategorilove/love.png"
                    },
                    {
                      "title": "Cinta bukan Sekedar Cinta",
                      "description": "Sebuah buku yang mengisahkan cinta yang luar biasa.",
                      "image": "assets/image/kategorilove/love1.png"
                    },
                    {
                      "title": "Cinta paling rumit",
                      "description": "Cerita tentang cinta yang rumit melampaui batas akal sehat dan logika.",
                      "image": "assets/image/kategorilove/love2.png"
                    },
                  ];

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BookDetailPage(
                            title: books[index]["title"]!,
                            description: books[index]["description"]!,
                            image: books[index]["image"]!,
                          ),
                        ),
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset(
                              books[index]["image"]!,
                              fit: BoxFit.cover,
                              height: 250,
                              width: double.infinity,
                            ),
                          ),
                          const SizedBox(height: 8),
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
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                            child: Text(
                              books[index]["description"]!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.black54,
                                fontSize: 14,
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


//halaman detail buku
class BookDetailPage extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  const BookDetailPage({
    super.key,
    required this.title,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF0F358F)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Row(
          children: [
            Image.asset(
              'assets/image/logo polos.png',
              width: 50,
              height: 50,
            ),
            const SizedBox(width: 8),
            const Text(
              'Book Detail',
              style: TextStyle(
                color: Color(0xFF0F358F),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        backgroundColor: Color(0xFFF4E2F2), // Warna latar belakang AppBar
        elevation: 0,
      ),
      body: Container(
        color: Color(0xFFF4E2F2), // Latar belakang seluruh body
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Bagian Gambar Buku dan Deskripsi
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        image,
                        width: 120, // Gambar sedikit lebih besar
                        height: 180, // Sesuaikan tinggi gambar
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title, // Judul Buku
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF0F358F),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            description, // Deskripsi Buku
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20), // Jarak antar elemen

                // Tombol Aksi yang diposisikan di tengah
                Center(
                  child: InkWell(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Tombol diklik!')),
                      );
                    },
                    borderRadius: BorderRadius.circular(12),
                    splashColor: Color(0xFF0F358F), // Warna ripple
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 35.0),
                      decoration: BoxDecoration(
                        color: Color(0xFFDDE5FF), // Warna biru muda hanya untuk tombol ini
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min, // Supaya ukuran tombol mengikuti ukuran konten
                        children: [
                          Icon(
                            Icons.book, // Ikon buku
                            color: Color(0xFF0F358F),
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            'PINJAM BUKU',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF0F358F), // Warna dongker
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20), // Jarak antar tombol dan informasi

                // Informasi Buku
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'Informasi Buku:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0F358F),
                    ),
                  ),
                ),
                const Text(
                  'Judul Buku: Cinta\nPenulis: Farah\nPenerbit: Devi\nNo Buku: 001\nTahun Terbit: 2008\nKategori Buku: Cinta',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),

                const SizedBox(height: 20), // Jarak antar informasi dan sinopsis

                // Sinopsis Buku
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'Sinopsis:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0F358F),
                    ),
                  ),
                ),
                const Text(
                  'Buku ini adalah panduan lengkap tentang kehidupan, cinta, dan petualangan. Buku ini akan membawa pembaca dalam perjalanan emosional yang mendalam.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
