import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rekomendasi Wisata Banyumas',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Rekomendasi Wisata Banyumas'),
          backgroundColor: const Color.fromARGB(255, 228, 164, 185),
        ),
        body: TempatWisataList(),
      ),
    );
  }
}

class TempatWisataList extends StatelessWidget {
  final List<Map<String, String>> tempatWisata = [
    {
      'nama': 'Curug Bayan',
      'gambar': 'https://i3.wp.com/inilahgateway.sgp1.cdn.digitaloceanspaces.com/2023/01/178518-0109_010635_46df_inilah.com_.jpg?w=780&resize=780,470&ssl=1',
      'deskripsi': 'Curug Bayan merupakan salah satu obyek wisata di lereng Gunung Slamet yang menarik untuk dikunjungi bersama keluarga. Kawasan wisata ini cocok untuk melepas penat dari rutinitas.',
    },
    {
      'nama': 'Baturaden',
      'gambar': 'https://awsimages.detik.net.id/community/media/visual/2023/09/05/lokawisata-baturraden-1.jpeg?w=800',
      'deskripsi': 'Baturaden terkenal dengan udara sejuk dan pemandangan pegunungan yang indah. Terdapat berbagai atraksi seperti pemandian air panas dan kebun binatang mini.',
    },
    {
      'nama': 'Telaga Sunyi',
      'gambar': 'https://asset.kompas.com/crops/vxRAizFnKzwHQCGVnHj75LwEsdc=/0x0:1000x667/750x500/data/photo/2019/04/25/3382861744.jpg',
      'deskripsi': 'Telaga Sunyi adalah tempat yang cocok untuk menikmati ketenangan alam. Dikelilingi oleh pepohonan, air di telaga ini sangat jernih dan menyegarkan.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tempatWisata.length,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  tempatWisata[index]['nama']!,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Image.network(
                tempatWisata[index]['gambar']!,
                height: 200,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  tempatWisata[index]['deskripsi']!,
                  textAlign: TextAlign.justify,
                ),
              ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  // Tambahkan aksi saat tombol diklik
                },
                child: Text('Kunjungi Sekarang'),
              ),
              SizedBox(height: 8),
            ],
          ),
        );
      },
    );
  }
}
