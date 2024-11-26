import 'package:flutter/material.dart';
import 'package:unguided/helper/db_helper.dart';

class MyDbView extends StatefulWidget {
  const MyDbView({super.key});

  @override
  State<MyDbView> createState() => MyDbViewState();
}

class MyDbViewState extends State<MyDbView> {

  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _nimController = TextEditingController();
  final TextEditingController _alamatController = TextEditingController();
  final TextEditingController _hobiController = TextEditingController();

  Future<void> _saveData() async {
    if (_namaController.text.isNotEmpty &&
    _nimController.text.isNotEmpty &&
    _alamatController.text.isNotEmpty &&
    _hobiController.text.isNotEmpty) {
      final Map<String, dynamic> row = {
        'nama' : _namaController.text,
        'nim' : _nimController.text,
        'alamat' : _alamatController.text,
        'hobi' : _hobiController.text
      };

      await DatabaseHelper().insert(row);
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Semua harus diisi!'))
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Biodata Mahasiswa'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _namaController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.person),
                labelText: 'Nama',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _nimController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.confirmation_number),
                labelText: 'Nim',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _alamatController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.home),
                labelText: 'Alamat',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _hobiController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.local_activity),
                labelText: 'Hobi',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton(onPressed: _saveData,
            child: 
              const Text('Simpan', style: TextStyle(color: Colors.black),),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber
              ),
            )
          ],
        ),
      ),
    );
  }
}
