import 'package:flutter/material.dart';
import 'package:guided/custom.dart';
import 'package:guided/jenis_list_view.dart';
import 'package:guided/flexible.expanded.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: 
      Custom(),
      // FlexibleExpandedScreen(),
      // JenisListView(),
    );
  }
}
