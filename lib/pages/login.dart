import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true; // Initially hide the password

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(); // Navigate back to previous screen
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color:
                    const Color(0xFFF7F8F9), // Background color for text fields
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: TextFormField(
                controller: _usernameController,
                style: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'Urbanist',
                    fontSize: 16.0),
                decoration: const InputDecoration(
                  hintText: 'Enter your email',
                  hintStyle: TextStyle(color: Color(0xFF8391A1)),
                  border: InputBorder.none,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color:
                    const Color(0xFFF7F8F9), // Background color for text fields
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: TextFormField(
                controller: _passwordController,
                style: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'Urbanist',
                    fontSize: 16.0),
                decoration: InputDecoration(
                  hintText: 'Enter your password',
                  hintStyle: const TextStyle(color: Color(0xFF8391A1)),
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                ),
                obscureText: _obscureText,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // Handle forgot password action
                },
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity, // Full width button
              child: ElevatedButton(
                onPressed: () {
                  // Handle login logic here
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(
                      const Color(0xFF169CC8)), // Background color
                  foregroundColor: WidgetStateProperty.all<Color>(
                      Colors.white), // Text color
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0), // Border radius
                    ),
                  ),
                ),
                child: const Text('Login'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
