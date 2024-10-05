import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rekomendasi Wisata',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Rekomendasi Wisata'),
          backgroundColor: Colors.pink,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Judul Tempat Wisata
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Pantai Teluk Penyu',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 16),

              // Gambar Tempat Wisata
              Image.network(
                'https://disporapar.cilacapkab.go.id/wp-content/uploads/2020/09/IMG_20190419_064820-300x169.jpg', 
                height: 200,
                fit: BoxFit.cover, // Mengatur tampilan gambar agar lebih baik
              ),
              SizedBox(height: 16),

              // Deskripsi Tempat Wisata
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Pantai Teluk Penyu terletak di dalam kota Cilacap, tepatnya di Kelurahan Cilacap, Kecamatan Cilacap Selatan. Obyek Wisata ini obyek wisata andalan yang dimilikiKabupaten Cilacap, jaraknya sangat dekat dengan Pusat Pemerintahan / Pusat Kota yaitu hanya sekitar ± 2 km. Panorama Pulau Nusakambangan dan Kapal Tanker pengangkut minyak yang menjadi pemandangan khas pantai ini. Pantai ini berpasir dan banyak ditumbuhi pepohonan sehingga memberikan rasa keteduhan bagi para pengunjung. Panorama keindahan Pantai laut yang indah ternyata dapat dinikmati oleh wisatawan tidak hanya pada saat matahari terbit pagi hari tapi juga matahari terbenam pada sore hari (sunset) di ujung sisi selatan. Pantai Teluk Penyu terdapat daya tarik wisata Benteng pendem dan Kilang pengolahan minyak milik PT. Pertamina, dimana lokasi ini menjadi obyek vital nasional.',
                  textAlign: TextAlign.justify, // Meratakan teks
                ),
              ),
              SizedBox(height: 16),

              // Tombol Kunjungi
              ElevatedButton(
                onPressed: () {
                  // Tambahkan kode tindakan di sini!
                },
                child: Text('Kunjungi Sekarang'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
