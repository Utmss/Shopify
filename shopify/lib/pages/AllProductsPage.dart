import 'package:flutter/material.dart';
import 'package:shopify/product/headphone.dart';
import 'package:shopify/product/laptop.dart';
import 'package:shopify/product/tv.dart';
import 'package:shopify/product/watch.dart';

class AllProductsPage extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {"name": "Headphone", "image": "assets/headphone.png", "detailsPage": HeadphonePage()},
    {"name": "Laptop", "image": "assets/laptop.png", "detailsPage": LaptopPage()},
    {"name": "TV", "image": "assets/TV.png", "detailsPage": TvPage()},
    {"name": "Watch", "image": "assets/watch.png", "detailsPage": WatchPage()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("All Products")),
      body: GridView.builder(
        padding: EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, 
          crossAxisSpacing: 10, 
          mainAxisSpacing: 10,
          childAspectRatio: 0.8,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => products[index]["detailsPage"],
              ));
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(color: Colors.grey.shade300, blurRadius: 5)
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(products[index]["image"], height: 100, fit: BoxFit.cover),
                  SizedBox(height: 10),
                  Text(products[index]["name"], style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
