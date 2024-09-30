import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
          backgroundColor: Colors.yellow[700],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Gambar profil dari folder img
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('img/profile-picture.jpeg'),
                  backgroundColor: Colors.blueGrey,
                ),
                SizedBox(height: 20),
                
                // Biodata
                Card(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    leading: Icon(Icons.person, color: Colors.yellow),
                    title: Text('Nama Lengkap',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text('Irfan Muria'),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 5,
                ),
                
                Card(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    leading: Icon(Icons.male, color: Colors.yellow),
                    title: Text('Jenis Kelamin',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text('Laki - Laki'),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 5,
                ),
                
                Card(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    leading: Icon(Icons.badge, color: Colors.yellow),
                    title: Text('NIM',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text('2211104075'),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 5,
                ),
                
                Card(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    leading: Icon(Icons.email, color: Colors.yellow),
                    title: Text('Email',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text('irfanmuria04@gmail.com'),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 5,
                ),
                
                Card(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    leading: Icon(Icons.school, color: Colors.yellow),
                    title: Text('Universitas',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text('Universitas Telkom Purwokerto'),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 5,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
