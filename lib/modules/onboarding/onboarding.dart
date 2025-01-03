import 'package:flutter/material.dart';

// Make sure to import Onboarding2Screen.dart
import 'onboarding2.dart'; // Replace with your actual import for onboarding2.dart

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OnboardingScreen(),
    );
  }
}

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        // Wrap the entire content in a SingleChildScrollView
        child: Column(
          children: [
            // Gambar Status Bar dengan ukuran dinamis
            Container(
              width: screenWidth,
              height: 42, // Fixed height for the status bar
              child: Image.asset(
                'images/artboard1.png', // Ganti dengan path gambar status bar
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8), // Spasi setelah status bar

            // Logo Gojek di kiri dan logo Language di kanan dengan posisi khusus
            Container(
              width: screenWidth,
              height: screenHeight * 0.2, // Proportional height
              child: Stack(
                children: [
                  // Logo Gojek
                  Positioned(
                    top: 57,
                    left: 15,
                    child: Image.asset(
                      'images/logogojek.png', // Ganti dengan path logo Gojek
                      width: 85,
                      height: 20,
                    ),
                  ),
                  // Logo Language
                  Positioned(
                    top: 54,
                    left: screenWidth -
                        15 -
                        26, // Dynamically positioned to the right
                    child: Image.asset(
                      'images/language.png', // Ganti dengan path logo Language
                      width: 26,
                      height: 26,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16), // Spasi setelah logo

            // Konten utama
            Image.asset(
              'images/onboarding1.png', // Ganti dengan path ilustrasi onboarding
              height: screenHeight * 0.3, // Proportional height for the image
            ),
            const SizedBox(height: 20),
            Text(
              'Selamat datang di gojek!',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Aplikasi yang bikin hidupmu lebih nyaman.\nSiap bantuin semua kebutuhanmu, kapanpun\ndi manapun.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                4,
                (index) => GestureDetector(
                  onTap: () {
                    // Navigate to onboarding2.dart when a dot is tapped
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Onboarding2()),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: index == 0 ? Colors.green : Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20), // Spacing between content and buttons

            // Bagian bawah: Tombol Masuk, Daftar, dan Ketentuan
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF006C02), // Button color
                      fixedSize: const Size(330, 40), // Fixed width and height
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(20), // Rounded corners
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8), // Padding inside the button
                    ),
                    child: const Text(
                      'Masuk',
                      style: TextStyle(
                        color: Colors.white, // Text color
                        fontSize: 16, // Text size
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  // TextButton with Border
                  Container(
                    width: 330, // Fixed width
                    height: 40, // Fixed height
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Color(0xFF006C02), width: 1), // Border
                      borderRadius:
                          BorderRadius.circular(20), // Rounded corners
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8), // Padding inside the button
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Belum ada akun? Daftar dulu', // Text content
                        style: TextStyle(
                          fontFamily: 'SF Pro Text', // Font family
                          fontWeight: FontWeight.w700, // Font weight
                          fontSize: 16, // Font size
                          height: 1, // Line height (16px matches font size)
                          letterSpacing: 0.01, // Letter spacing (1%)
                          color: Color(0xFF006C02), // Text color
                        ),
                        textAlign: TextAlign.center, // Center alignment
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Teks Ketentuan layanan dan Kebijakan privasi
                  Text.rich(
                    TextSpan(
                      text: 'Dengan masuk atau mendaftar, kamu menyetujui\n',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                      children: [
                        TextSpan(
                          text: 'Ketentuan layanan',
                          style: TextStyle(
                            color: Color(0xFF0081A0),
                          ),
                        ),
                        TextSpan(
                          text: ' dan ',
                        ),
                        TextSpan(
                          text: 'Kebijakan privasi',
                          style: TextStyle(
                            color: Color(0xFF0081A0),
                          ),
                        ),
                        TextSpan(
                          text: '.',
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
