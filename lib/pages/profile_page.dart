import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: const Color.fromRGBO(244, 226, 242, 1.0),
      ),
      body: Center(
        child: const Text('Ini adalah halaman profil'),
      ),
    );
  }
}
