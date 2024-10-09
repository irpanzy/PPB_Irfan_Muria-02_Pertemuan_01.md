import 'package:flutter/material.dart';

class gridView extends StatefulWidget {
  const gridView({super.key});

  @override
  State<gridView> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<gridView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Praktikum 4'),
        backgroundColor: Colors.blueAccent[700],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        padding: EdgeInsets.all(12),
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Icon(Icons.account_circle, size: 100),
                Text('irpanzy')
              ],
            ),
            color: Colors.amberAccent,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Icon(Icons.account_balance_wallet_sharp, size: 100),
                Text('Mandiri')
              ],
            ),
            color: Colors.greenAccent,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Icon(Icons.account_balance, size: 100),
                Text('Imba JP')
              ],
            ),
            color: Colors.redAccent,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Icon(Icons.add_alarm_sharp, size: 100),
                Text('Alarm')
              ],
            ),
            color: Colors.blueAccent,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text('gridView 5'),
            color: Colors.yellowAccent,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text('gridView 6'),
            color: Colors.purpleAccent,
          ),
        ],
      ),
    );
  }
}
