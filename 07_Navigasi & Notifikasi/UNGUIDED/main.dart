import 'package:flutter/material.dart';
import 'models/product.dart';
import 'screens/product_detail_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-commerce App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ProductListScreen(),
    );
  }
}

class ProductListScreen extends StatelessWidget {
  final List<Product> products = [
    Product(
      id: 1,
      name: "Stylish Shoes",
      description: "Sepatu yang nyaman dan trendi yang sempurna untuk dipakai sehari-hari.",
      price: 650.000,
      imageUrl: "https://jonasparamount.com/cdn/shop/products/yyyu.png?v=1673276464",
    ),
    Product(
      id: 2,
      name: "Casual Jacket",
      description: "Jaket keren untuk menambah gaya pada pakaian apa pun.",
      price: 950.000,
      imageUrl: "https://oxa.co.id/cdn/shop/files/Layer3_2c9c75b5-8da5-4153-a65b-732e3cd019c6.jpg?v=1714029329",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Our Products')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Tampilkan 2 kolom
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.75, // Rasio lebar dan tinggi grid
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailScreen(product: product),
                  ),
                );
              },
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                      child: Image.network(
                        product.imageUrl,
                        height: 120,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name,
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '\Rp${product.price.toStringAsFixed(2)}',
                            style: TextStyle(fontSize: 16, color: Colors.green),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
