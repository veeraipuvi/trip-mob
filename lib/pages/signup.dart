import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignupForm extends StatefulWidget {
  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true; // Initially hide the password

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your username';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                // Add email validation if necessary
                return null;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _passwordController,
              obscureText: _obscureText,
              decoration: InputDecoration(
                labelText: 'Password',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                // Add password validation if necessary
                return null;
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle signup logic here
                _submitForm();
              },
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }

  void _submitForm() async {
    // Validate form
    if (Form.of(context)!.validate()) {
      // Form is valid, proceed with signup logic
      String username = _usernameController.text.trim();
      String email = _emailController.text.trim();
      String password = _passwordController.text;

      // Example signup logic (replace with your actual signup implementation)
      Map<String, String> userData = {
        'username': username,
        'email': email,
        'password': password,
      };

      String apiUrl = 'https://your-api-url.com/signup'; // Replace with your API endpoint

      try {
        var response = await http.post(
          Uri.parse(apiUrl),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(userData),
        );

        if (response.statusCode == 200) {
          // Successful signup
          print('Signup successful');
          // Navigate to another screen or perform other actions
          // For example:
          // Navigator.pushNamed(context, '/home');
        } else {
          // Error during signup
          print('Signup failed: ${response.body}');
          // Handle error (show message, retry, etc.)
        }
      } catch (e) {
        print('Error during signup: $e');
        // Handle network error
      }
    }
  }

  @override
  void dispose() {
    // Clean up the controllers when the widget is disposed.
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}

void main() {
  runApp(MaterialApp(
    home: SignupForm(),
  ));
}
