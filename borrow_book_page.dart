import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Impor package intl

class BorrowBookPage extends StatefulWidget {
  const BorrowBookPage({super.key});

  @override
  _BorrowBookPageState createState() => _BorrowBookPageState();
}

class _BorrowBookPageState extends State<BorrowBookPage> {
  String selectedButton = '';
  String borrowedDate = '';
  String returnDate = '';
  String bookTitle = "Cinta";
  String bookDescription = "  Novel ini menceritakan...";

  @override
  void initState() {
    super.initState();
    DateTime today = DateTime.now();
    DateTime returnDueDate = today.add(Duration(days: 21));

    borrowedDate = DateFormat('d MMMM yyyy').format(today);
    returnDate = DateFormat('d MMMM yyyy').format(returnDueDate);
  }

  void _navigateToProfilePage(BuildContext context) {
    Navigator.pushNamed(context, '/profile');
  }

  Widget _buildDateBox(String date, {Color backgroundColor = Colors.white}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
      width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.zero,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Text(
        date,
        style: TextStyle(
          fontSize: 18,
          color: Colors.black,
        ),
      ),
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
              'Borrow Book',
              style: TextStyle(
                color: Color.fromRGBO(15, 53, 143, 1.0),
                fontSize: 20,
              ),
            ),
          ],
        ),
        backgroundColor: const Color.fromRGBO(244, 226, 242, 1.0),
        automaticallyImplyLeading: false,
        actions: [
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
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(2.0),
          child: Container(
            color: Colors.blue,  // Set the divider color to blue
            height: 2.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          color: const Color.fromRGBO(244, 226, 242, 1.0),
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16), // Added space between header and buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedButton = 'buku';
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(150, 50),
                      backgroundColor: selectedButton == 'buku'
                          ? const Color.fromRGBO(241, 109, 221, 1.0)
                          : Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    child: Text('Buku'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedButton = 'eBuku';
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(150, 50),
                      backgroundColor: selectedButton == 'eBuku'
                          ? const Color.fromRGBO(241, 109, 221, 1.0)
                          : Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    child: Text('E-Buku'),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Text(
                'Tanggal Pinjam:',
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromRGBO(15, 53, 143, 1.0),
                ),
              ),
              const SizedBox(height: 8),
              _buildDateBox(borrowedDate, backgroundColor: Colors.red[100]!),
              const SizedBox(height: 16),
              Text(
                'Tanggal Kembalian:',
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromRGBO(15, 53, 143, 1.0),
                ),
              ),
              const SizedBox(height: 8),
              _buildDateBox(returnDate, backgroundColor: Colors.red[100]!),
              const SizedBox(height: 16),
              Row(
                children: [
                  Image.asset(
                    'assets/image/kategorilove/love3.png',
                    width: 90,
                    height: 120,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          bookTitle,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          bookDescription,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              // Tombol Pinjam dan Kembalikan Vertikal di Tengah
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        print('Kembalikan button pressed');
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(150, 50),
                        backgroundColor: Color.fromRGBO(241, 109, 221, 1.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                      ),
                      child: Text('Kembalikan'),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        print('Pinjam button pressed');
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(150, 50),
                        backgroundColor: Color.fromRGBO(241, 109, 221, 1.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                      ),
                      child: Text('Pinjam'),
                    ),
                  ],
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

  Widget _buildNavItem(BuildContext context, int index, IconData icon) {
    final isSelected = ModalRoute.of(context)?.settings.name == '/borrow' && index == 2;
    return GestureDetector(
      onTap: () {
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
