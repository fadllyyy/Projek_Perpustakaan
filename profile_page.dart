import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final Color buttonColor1; // For the "Ungu" button
  final Color buttonColor2; // For the "Logout" button
  final Color textColor; // Text color
  final Color dividerColor; // Divider color
  final Color titleColor; // Color for the title "Informasi Akun"
  final Color subtitleColor; // Color for subtitles

  // Constructor to add color parameters
  const ProfilePage({
    super.key,
    this.buttonColor1 = const Color(0xFFCE7FDD), // Default color for "Ungu" button (hex code)
    this.buttonColor2 = const Color(0xFFFB4F4F), // Default color for "Logout" button (hex code)
    this.textColor = const Color(0xFF2196F3), // Default text color (hex code)
    this.dividerColor = const Color(0xFF9C27B0), // Default divider color (hex code)
    this.titleColor = const Color(0xFF2196F3), // Default title color (hex code)
    this.subtitleColor = const Color(0xFF2196F3), // Default subtitle color (hex code)
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pengaturan Akun',
          style: TextStyle(color: Color(0xFF9C27B0)), // AppBar text in purple color
        ),
        backgroundColor: const Color.fromRGBO(244, 226, 242, 1.0),
        iconTheme: const IconThemeData(color: Color(0xFF9C27B0)), // AppBar icon in purple color
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Profile Picture
              const SizedBox(height: 20),
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('assets/image/profile.jpg'), // Replace with your profile picture path
              ),
              const SizedBox(height: 10),

              // "Ubah Profile" Button
              TextButton(
                onPressed: () {
                  print('Ubah Profile Pressed');
                },
                child: Text(
                  'Ubah Profile',
                  style: TextStyle(
                    fontSize: 16,
                    color: buttonColor1, // Button color ("Ungu" button)
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 5),

              // "Tap to change" text
              const Text(
                'Ketuk untuk mengubah',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF2196F3), // Blue text
                  fontStyle: FontStyle.italic,
                ),
              ),

              const SizedBox(height: 20),

              // Divider line
              Container(
                height: 1.5,
                color: dividerColor, // Divider color
                width: double.infinity,
              ),
              const SizedBox(height: 10),

              // Account Information Title
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  'Informasi Akun',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: titleColor, // Title color ("Informasi Akun")
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Email Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text('Email', style: TextStyle(fontSize: 18, color: subtitleColor)),
                        ),
                        Expanded(
                          flex: 3,
                          child: Text(': farahnasy@gmail.com', style: TextStyle(fontSize: 18, color: subtitleColor)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    // Name Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text('Nama', style: TextStyle(fontSize: 18, color: subtitleColor)),
                        ),
                        Expanded(
                          flex: 3,
                          child: Text(': Farah Nasywa', style: TextStyle(fontSize: 18, color: subtitleColor)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    // NIM Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text('NIM', style: TextStyle(fontSize: 18, color: subtitleColor)),
                        ),
                        Expanded(
                          flex: 3,
                          child: Text(': 2022573010013', style: TextStyle(fontSize: 18, color: subtitleColor)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    // Birthdate Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text('Tanggal Lahir', style: TextStyle(fontSize: 18, color: subtitleColor)),
                        ),
                        Expanded(
                          flex: 3,
                          child: Text(': 16-05-2005', style: TextStyle(fontSize: 18, color: subtitleColor)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    // Major Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text('Jurusan', style: TextStyle(fontSize: 18, color: subtitleColor)),
                        ),
                        Expanded(
                          flex: 3,
                          child: Text(': Teknologi Informasi dan Komputer', style: TextStyle(fontSize: 18, color: subtitleColor)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    // Program Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text('Prodi', style: TextStyle(fontSize: 18, color: subtitleColor)),
                        ),
                        Expanded(
                          flex: 3,
                          child: Text(': Teknik Informatika', style: TextStyle(fontSize: 18, color: subtitleColor)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),  // Reduced space before buttons

              // Container to hold both buttons with consistent width
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  children: [
                    // "Ganti Password" Button
                    ElevatedButton(
                      onPressed: () {
                        print('Ganti Password Pressed');
                      },
                      child: const Text('Ganti Password'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: buttonColor1, // "Ungu" button color
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10), // Reduced padding
                        textStyle: const TextStyle(fontSize: 14, color: Colors.white), // Smaller text
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        minimumSize: Size(200, 40), // Smaller button size
                      ),
                    ),
                    const SizedBox(height: 10),  // Reduced space

                    // "Logout" Button
                    ElevatedButton(
                      onPressed: () {
                        print('Logout Pressed');
                      },
                      child: const Text('Logout'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: buttonColor2, // Logout button color
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10), // Reduced padding
                        textStyle: const TextStyle(fontSize: 14, color: Colors.white), // Smaller text
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        minimumSize: Size(200, 40), // Smaller button size
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}