import 'package:flutter/material.dart';
import 'borrow_book_page.dart';
import 'profile_page.dart';
import 'kategori_page.dart';
import 'history_page.dart'; // Halaman histori
import 'notification_page.dart'; // Halaman notifikasi

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;
  final TextEditingController _searchController = TextEditingController();

  final Color backgroundColor = const Color.fromRGBO(244, 226, 242, 1.0);
  final Color customTextColor = const Color.fromRGBO(15, 53, 143, 1.0);
  final Color searchBoxBackgroundColor = Colors.purple[50]!;
  final Color searchTextColor = Colors.black;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SearchPage()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const BorrowBookPage()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HistoryPage()),
        );
        break;
      case 4:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const NotificationPage()),
        );
        break;
      default:
      // Tetap di Dashboard untuk index 0
        break;
    }
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
              'assets/image/logo polos.png',
              width: 75,
              height: 75,
            ),
            const SizedBox(width: 32),
            Text(
              'Dashboard',
              style: TextStyle(
                color: Color.fromRGBO(15, 53, 143, 1.0),
                fontSize: 20,
              ),
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
                backgroundImage: AssetImage('assets/image/profile.png'),
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
              const SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                child: TextField(
                  controller: _searchController,
                  style: TextStyle(color: searchTextColor),
                  decoration: InputDecoration(
                    hintText: 'Cari Buku...',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    filled: true,
                    fillColor: searchBoxBackgroundColor,
                    suffixIcon: IconButton(
                      icon: Icon(Icons.search, color: Colors.grey),
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
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Terbaru',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: customTextColor,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Buku yang Baru Dirilis',
                      style: TextStyle(
                        fontSize: 14,
                        color: customTextColor,
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
                    padding: const EdgeInsets.only(bottom: 10),
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
                                padding: const EdgeInsets.only(right: 6),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        'assets/image/buku/book_cover_$bookIndex.png',
                                        fit: BoxFit.contain,
                                        width: 90,
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
