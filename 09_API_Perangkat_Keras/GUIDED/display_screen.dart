import 'package:flutter/material.dart';
import 'dart:io';

class DisplayScreen extends StatelessWidget {
  // mulai dari sini
  final String imagePath;

  const DisplayScreen({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Display Screen'),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
      ),
      body: Image.file(File(imagePath)),
    );
  }
}
