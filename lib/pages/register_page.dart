import 'package:flutter/material.dart';
import 'package:projek_perpustakaan/pages/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _dateController = TextEditingController();

  // Variabel untuk dropdown
  String? _selectedJurusan;
  String? _selectedProdi;

  // Daftar pilihan Jurusan
  final List<String> jurusanList = [
    'Teknik Kimia',
    'Teknik Mesin',
    'Teknik Elektro',
    'Teknik Informatika',
    'Sistem Informasi',
  ];

  // Map untuk Prodi berdasarkan Jurusan
  final Map<String, List<String>> prodiMap = {
    'Teknik Kimia': [
      'Teknik Kimia Industri',
      'Teknik Kimia Biologi',
    ],
    'Teknik Mesin': [
      'Teknik Sepeda Motor',
      'Teknik Kendaraan Berat',
    ],
    'Teknik Elektro': [
      'Teknik Komputer',
      'Teknik Telekomunikasi',
    ],
  };

  List<String> prodiList = [];

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (selectedDate != null) {
      setState(() {
        _dateController.text = "${selectedDate.toLocal()}".split(' ')[0];
      });
    }
  }

  // Fungsi untuk menampilkan dialog sukses
  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Akun Anda Berhasil Terdaftar'),
          content: const Text('Silakan login untuk melanjutkan.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RegisterPage(),
                  ),
                );
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(244, 226, 242, 1.0),
                Color.fromRGBO(244, 226, 242, 1.0),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Gambar logo
                Container(
                  width: 250,
                  height: 250,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/image/logo.png"),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // TextField untuk Email
                _buildTextField("Email", false),
                const SizedBox(height: 15),

                // TextField untuk Nama
                _buildTextField("Nama", false),
                const SizedBox(height: 15),

                // TextField untuk NIM
                _buildTextField("NIM", false),
                const SizedBox(height: 15),

                // TextField untuk Tanggal Lahir
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: TextField(
                    controller: _dateController,
                    readOnly: true,
                    decoration: InputDecoration(
                      labelText: "Tanggal Lahir",
                      labelStyle: const TextStyle(
                        fontSize: 14,
                        color: Color.fromRGBO(15, 53, 143, 1.0),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 10,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.calendar_today),
                        onPressed: () => _selectDate(context),
                      ),
                    ),
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color.fromRGBO(15, 53, 143, 1.0),
                    ),
                  ),
                ),
                const SizedBox(height: 15),

                // Dropdown untuk Jurusan
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: DropdownButtonFormField<String>(
                    value: _selectedJurusan,
                    decoration: InputDecoration(
                      labelText: "Jurusan",
                      labelStyle: const TextStyle(
                        fontSize: 14,
                        color: Color.fromRGBO(15, 53, 143, 1.0),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 10,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    items: jurusanList.map((String jurusan) {
                      return DropdownMenuItem<String>(
                        value: jurusan,
                        child: Text(
                          jurusan,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color.fromRGBO(15, 53, 143, 1.0),
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedJurusan = value;
                        prodiList = prodiMap[value!] ?? [];
                        _selectedProdi = null;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 15),

                // Dropdown untuk Prodi
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: DropdownButtonFormField<String>(
                    value: _selectedProdi,
                    decoration: InputDecoration(
                      labelText: "Prodi",
                      labelStyle: const TextStyle(
                        fontSize: 14,
                        color: Color.fromRGBO(15, 53, 143, 1.0),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 10,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    items: prodiList.map((String prodi) {
                      return DropdownMenuItem<String>(
                        value: prodi,
                        child: Text(
                          prodi,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color.fromRGBO(15, 53, 143, 1.0),
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedProdi = value;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 15),

                // TextField untuk Password
                _buildTextField("Password", true),
                const SizedBox(height: 20),

                // Tombol Daftar
                ElevatedButton(
                  onPressed: () {
                    if (_selectedJurusan != null &&
                        _selectedProdi != null &&
                        _dateController.text.isNotEmpty) {
                      // Tampilkan dialog sukses
                      _showSuccessDialog(context);
                    } else {
                      // Jika ada inputan yang belum lengkap
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Silakan lengkapi semua data!')),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(221, 229, 255, 1.0),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 10,
                    ),
                  ),
                  child: const Text(
                    "Daftar",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color.fromRGBO(15, 53, 143, 1.0),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Link untuk kembali ke login
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Sudah punya akun? "),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
                      },
                      child: const Text(
                        "Back to Login",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Fungsi untuk membuat TextField secara generik
  Widget _buildTextField(String label, bool isPassword) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: TextField(
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(
            fontSize: 14,
            color: Color.fromRGBO(15, 53, 143, 1.0),
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 10,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        style: const TextStyle(
          fontSize: 14,
          color: Color.fromRGBO(15, 53, 143, 1.0),
        ),
      ),
    );
  }
}
