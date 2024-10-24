import 'dart:ui';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rekomendasi Wisata',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: TouristSpotsPage(),
    );
  }
}

class TouristSpotsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            // title: Text('Rekomendasi Wisata'),
            title: Text(
                    'Rekomendasi Wisata Di Banyumas',
                    style: TextStyle(
                      fontSize: 24, // Ukuran font yang lebih besar
                      fontWeight: FontWeight.bold, // Bold
                      color: const Color.fromARGB(255, 255, 251, 251), // Warna teks
                    ),
                  ),
            centerTitle: true, // Menempatkan judul di tengah
            backgroundColor: Colors.cyan,
            floating: true,
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    'https://kuninganmass.com/wp-content/uploads/2021/08/IMG_20210830_104954.jpg',
                    fit: BoxFit.cover,
                  ),
                  // Menambahkan BackdropFilter untuk efek blur
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                    child: Container(
                      color: Colors.black.withOpacity(0.3), // Menambahkan efek gelap
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return _buildTouristSpot(touristSpots[index]);
              },
              childCount: touristSpots.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTouristSpot(Map<String, String> spot) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        children: [
          Image.network(
            spot['image']!,
            height: 200,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              spot['name']!,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              spot['description']!,
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Tambahkan kode tindakan di sini!
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.pink,
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              textStyle: TextStyle(fontSize: 18),
            ),
            child: Text('Kunjungi Sekarang', style: TextStyle(color: Colors.black)),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }

  // Daftar tempat wisata
  final List<Map<String, String>> touristSpots = [
    {
      'name': 'Pabrik Gula Kalibagor',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfgtvsGaecJAdRy1g0sxaw-WHJxQmbOE9taA&s',
      'description': 'Pabrik Gula Kalibagor adalah pabrik terbesar milik Belanda di Banyumas, yang berdiri pada tahun 1839 dan menjadi simbol sejarah industri gula.'
    },
    {
      'name': 'Agro Wisata Germanggis',
      'image': 'https://dolanbanyumas.banyumaskab.go.id/assets/gambar_objek/agro-wisata-germanggis.jpg',
      'description': 'Germanggis adalah sebuah kawasan wisata alam berkonsep wisata fun education. Ditempat ini kita bisa menikmati alam bebas yang udaranya sangat sejuk namun juga bisa mengadakan camping ceria. '
    },
    {
      'name': 'Hutan Pinus Limpakuwus',
      'image': 'https://dolanbanyumas.banyumaskab.go.id/assets/gambar_objek/hutan-pinus-limpakuwus.jpg',
      'description': 'PHutan Pinus Limpakuwus tidak seperti hutan lainnya yang mungkin sering terasa menyeramkan. Hutan ini sudah ditata dan dikelola sedemikian rupa dan ada wahana bermain juga, sehingga cocok sebagai salah satu destinasi wisata keluarga yang ramah anak dengan pemandangan yang mempesona.'
    },
    {
      'name': 'Goa Maria Kaliori',
      'image': 'https://dolanbanyumas.banyumaskab.go.id/assets/gambar_objek/goa-maria-kaliori.jpg',
      'description': 'Terletak di perbukitan yang hijau dengan suasana sejuk dan nyaman di desa Kaliori Kecamatan Kalibagor yang berjarak sekitar 14 kilometer arah timur kota Purwokerto. Prakarsa pembangunan tempat ziarah ini bermula dari beberapa aktivis umat Katolik di Banyumas.'
    },
  ];
}
