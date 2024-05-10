import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/pp.jpg'),
              radius: 70,
            ),
            SizedBox(height: 20),
            ProfileField(
              label: 'Name',
              value: 'Ipung Nanda', // Ubah dengan nama pengguna yang sebenarnya
            ),
            ProfileField(
              label: 'Email',
              value:
                  'ipungkempung@gmail.com', // Ubah dengan email pengguna yang sebenarnya
            ),
            ProfileField(
              label: 'Password',
              value: '••••••••', // Tidak menampilkan password secara langsung
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Tambahkan fungsi untuk mereset password
              },
              child: Text('Reset Password'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileField extends StatelessWidget {
  final String label;
  final String value;

  ProfileField({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 10),
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.grey[700],
          ),
        ),
        SizedBox(height: 5),
        Text(
          value,
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 10),
        Divider(
          color: Colors.grey[300],
          thickness: 1,
        ),
      ],
    );
  }
}
