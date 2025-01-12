import 'package:flutter/material.dart';
import 'package:projekperpustakaan/pages/dashboard.dart';
import 'package:projekperpustakaan/pages/notification_page.dart';
import 'package:projekperpustakaan/pages/splash_page.dart';
import 'package:projekperpustakaan/pages/borrow_book_page.dart';
import 'package:projekperpustakaan/pages/history_page.dart';
import 'package:projekperpustakaan/pages/detail_book_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Perpustakaan",
      initialRoute: '/', // Set rute awal
      routes: {
        '/': (context) => SplashPage(), // Halaman splash sebagai halaman awal
        '/dashboard': (context) => DashboardPage(), // Halaman dashboard
        '/notification': (context) => NotificationPage(),
        '/borrow_book': (context) => BorrowBookPage(),
        '/history': (context) => HistoryPage(),// Halaman notifikasi// Halaman notifikasi
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
