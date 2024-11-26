import 'package:flutter/material.dart';
import 'package:unguided/helper/db_helper.dart';
import 'package:unguided/view/db_view.dart';

class MyMainView extends StatefulWidget {
  const MyMainView({super.key});

  @override
  State<MyMainView> createState() => _MyMainViewState();
}

class _MyMainViewState extends State<MyMainView> {
  List<Map<String, dynamic>> _dataList = [];

  Future<void> _fetchData() async {
    final data = await DatabaseHelper().queryAllRows();
    setState(() {
      _dataList = data;
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SQLite Biodata Mahasiswa'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: _dataList.length,
          itemBuilder: (context, index) {
            final item = _dataList[index];
            return Card(
              child: ListTile(
                title: Text(item['nama']),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('NIM : ${item['nim']}'),
                    Text('Alamat : ${item['alamat']}'),
                    Text('Hobi : ${item['hobi']}')
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
              context, MaterialPageRoute(builder: (context) => const MyDbView()));
          _fetchData();
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.amber,
      ),
    );
  }
}
