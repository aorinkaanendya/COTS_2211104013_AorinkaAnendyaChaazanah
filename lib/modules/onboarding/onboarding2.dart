import 'package:flutter/material.dart';

// Make sure to import Onboarding3Screen.dart
import 'onboarding3.dart'; // Replace with your actual import for onboarding3.dart

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Onboarding2(),
    );
  }
}

class Onboarding2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Gambar Status Bar dengan ukuran dinamis
            Container(
              width: screenWidth,
              height: 42,
              child: Image.asset(
                'images/artboard1.png', // Path to your status bar image
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8), // Spacing after status bar

            // Logo Gojek on the left and Language logo on the right
            Container(
              width: screenWidth,
              height: screenHeight * 0.2,
              child: Stack(
                children: [
                  Positioned(
                    top: 57,
                    left: 15,
                    child: Image.asset(
                      'images/logogojek.png',
                      width: 85,
                      height: 20,
                    ),
                  ),
                  Positioned(
                    top: 54,
                    left: screenWidth - 15 - 26,
                    child: Image.asset(
                      'images/language.png',
                      width: 26,
                      height: 26,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Main content (image and text)
            Image.asset(
              'images/onboarding2.png',
              height: screenHeight * 0.3,
            ),
            const SizedBox(height: 20),
            Text(
              'Transportasi & logistik',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Antarin kamu jalan atau ambilin barang lebih gampang tinggal ngeklik doang',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 20),

            // Dots for page indicators with GestureDetector
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                4,
                (index) => GestureDetector(
                  onTap: () {
                    // Navigate to onboarding3.dart when a dot is tapped
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Onboarding3()),
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

            // Bottom section: Buttons for login, registration, and terms
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF006C02),
                      fixedSize: const Size(330, 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                    ),
                    child: const Text(
                      'Masuk',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 10),

                  // TextButton with border for registration
                  Container(
                    width: 330,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFF006C02), width: 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Belum ada akun? Daftar dulu',
                        style: TextStyle(
                          fontFamily: 'SF Pro Text',
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: Color(0xFF006C02),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Terms of service and privacy policy text
                  Text.rich(
                    TextSpan(
                      text: 'Dengan masuk atau mendaftar, kamu menyetujui\n',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                      children: [
                        TextSpan(
                          text: 'Ketentuan layanan',
                          style: TextStyle(color: Color(0xFF0081A0)),
                        ),
                        TextSpan(text: ' dan '),
                        TextSpan(
                          text: 'Kebijakan privasi',
                          style: TextStyle(color: Color(0xFF0081A0)),
                        ),
                        TextSpan(text: '.'),
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
