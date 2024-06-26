import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.jpg'), // Path to your background image
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppBar(
                title: const Text('Welcome'),
                backgroundColor: Colors.transparent, // Make AppBar transparent
                elevation: 0, // Remove shadow
              ),
              Expanded(
                child: Container(), // Empty container to fill space
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome to Your App',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Explore and connect with your travel needs!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0), // Add padding around the buttons
                child: SizedBox(
                  width: double.infinity, // Full width button
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: const Color(0xFF169CC8), // Text color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2.0), // Border radius
                      ),
                    ),
                    child: const Text('Traveller'),
                  ),
                ),
              ),
              const SizedBox(height: 10), // Spacer between buttons
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0), // Add padding around the buttons
                child: SizedBox(
                  width: double.infinity, // Full width button
                  child: ElevatedButton(
                    onPressed: () {
                       Navigator.pushNamed(context, '/signup');
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: const Color(0xFF169CC8), // Example color for second button
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2.0), // Border radius
                      ),
                    ),
                    child: const Text('Add agency'),
                  ),
                ),
              ),
              const SizedBox(height: 10), // Spacer between buttons
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0), // Add padding around the buttons
                child: SizedBox(
                  width: double.infinity, // Full width button
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle second button action
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: const Color(0xFF169CC8), // Example color for second button
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2.0), // Border radius
                      ),
                    ),
                    child: const Text('Add as driver'),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }
}