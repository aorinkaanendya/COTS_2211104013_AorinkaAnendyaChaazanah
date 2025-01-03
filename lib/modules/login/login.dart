import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<Login> {
  TextEditingController _phoneController = TextEditingController();

  // Fungsi untuk menambahkan angka ke input
  void _onNumberPressed(String number) {
    setState(() {
      _phoneController.text += number;
    });
  }

  // Fungsi untuk menghapus angka terakhir
  void _onBackspacePressed() {
    setState(() {
      if (_phoneController.text.isNotEmpty) {
        _phoneController.text = _phoneController.text
            .substring(0, _phoneController.text.length - 1);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: screenWidth,
                  height: 42, // Fixed height for the status bar
                  child: Image.asset(
                    'images/artboard1.png', // Ganti dengan path gambar status bar
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 8),
                // Logo Gojek dan Back Button
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Image.asset(
                      'images/logogojek.png', // Ganti dengan path logo Gojek
                      width: 85,
                      height: 20,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // Form Login
                Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Enter your registered phone number to log in',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    // Prefix +62
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Text(
                            '+62',
                            style: TextStyle(fontSize: 16),
                          ),
                          Icon(Icons.keyboard_arrow_down, size: 16),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    // Input Phone Number
                    Expanded(
                      child: TextField(
                        controller: _phoneController,
                        keyboardType: TextInputType.none, // Disable keyboard
                        readOnly: true, // Only allow custom keypad input
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          labelText: 'Phone number',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    // Handle issue with number action
                  },
                  child: Text(
                    'Issue with number?',
                    style: TextStyle(color: Colors.green),
                  ),
                ),
                const SizedBox(height: 20),
                // Custom Keypad
                ElevatedButton(
                  onPressed: () {
                    // Handle continue action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF006C02),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    minimumSize: const Size(double.infinity, 48),
                  ),
                  child: const Text(
                    'Continue',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.5,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemCount: 12, // 0-9 plus backspace
                  itemBuilder: (context, index) {
                    if (index == 9) {
                      // Empty placeholder for layout alignment
                      return SizedBox.shrink();
                    } else if (index == 11) {
                      // Backspace button
                      return ElevatedButton(
                        onPressed: _onBackspacePressed,
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          backgroundColor: Colors.grey[300],
                        ),
                        child:
                            Icon(Icons.backspace_outlined, color: Colors.black),
                      );
                    } else {
                      // Number button
                      String number = index == 10 ? '0' : '${index + 1}';
                      return ElevatedButton(
                        onPressed: () => _onNumberPressed(number),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          backgroundColor: Colors.grey[300],
                        ),
                        child: Text(
                          number,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      );
                    }
                  },
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
