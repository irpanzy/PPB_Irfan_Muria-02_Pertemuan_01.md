import 'package:flutter/material.dart';
import 'package:guided/my_package.dart';
import 'package:guided/my_tab_bar.dart';

class MyNavbar extends StatefulWidget {
  const MyNavbar({super.key});

  @override
  State<MyNavbar> createState() => _MyNavbarState();
}

class _MyNavbarState extends State<MyNavbar> {
  int _selectedIndex = 0;

  // Daftar halaman yang akan ditampilkan pada masing-masing tab
  void _onTappedItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> _pages = <Widget>[
    MyTabBar(),
    MyPackage(),
    MyPackage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Button Navigation Bar"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Menu 1'),
          BottomNavigationBarItem(icon: Icon(Icons.person_2), label: 'Menu 2'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_2_sharp), label: 'Menu 3'),
        ],
        selectedItemColor: Colors.amber,
        currentIndex: _selectedIndex,
        onTap: _onTappedItem,
      ),
    );
  }
}