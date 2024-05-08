import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(95, 164, 161, 161), // Set app bar color
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              // Add functionality here
            },
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(166, 129, 127, 127),
      body: const Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage('lib/images/PP.jpg'), // Add profile image
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                'Camille Delos Santos (Collector)',
                style: TextStyle(fontSize: 24, fontFamily: 'CaveatBrush', fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 5),
            Divider(),
            SizedBox(height: 20),
            Text(
              'Info',
              style: TextStyle(fontSize: 20, fontFamily: 'CaveatBrush', fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              'Email: s2121731@usls.edu.ph',
              style: TextStyle(fontSize: 16, fontFamily: 'CaveatBrush'),
            ),
            Text(
              'Phone Number: 09983295427',
              style: TextStyle(fontSize: 16, fontFamily: 'CaveatBrush'),
            ),
          ],
        ),
      ),
    );
  }
}
