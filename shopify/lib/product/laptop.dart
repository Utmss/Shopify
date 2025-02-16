import 'package:flutter/material.dart';
import 'package:shopify/details/laptop_details.dart';
import 'package:shopify/widget/support_font.dart';

class LaptopPage extends StatefulWidget {
  const LaptopPage({super.key});

  @override
  State<LaptopPage> createState() => _LaptopPageState();
}

class _LaptopPageState extends State<LaptopPage> {
  TextEditingController searchController = TextEditingController();
  List<Map<String, String>> laptops = [
    {"name": "Lenovo", "price": "₹43390/-", "image": "assets/la1.webp"},
    {"name": "Dell", "price": "₹43390/-", "image": "assets/la2.webp"},
    {"name": "Acer", "price": "₹43390/-", "image": "assets/la3.webp"},
    {"name": "Hp", "price": "₹43390/-", "image": "assets/la4.webp"},
  ];

  List<Map<String, String>> filteredLaptops = [];

  @override
  void initState() {
    super.initState();
    filteredLaptops = laptops;
  }

  void searchLaptops(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredLaptops = laptops;
      } else {
        filteredLaptops = laptops
            .where((laptop) =>
                laptop["name"]!.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      appBar: AppBar(
        backgroundColor: Color(0xfff2f2f2),
        title: Center(
          child: Text("Laptop", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: searchController,
                onChanged: searchLaptops,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search Products",
                  hintStyle: Appwidget.lighttextfieldstyle(),
                  prefixIcon: Icon(Icons.search, color: Colors.black),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredLaptops.length,
              itemBuilder: (context, index) {
                var laptop = filteredLaptops[index];
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Image.asset(laptop["image"]!, width: 150),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(laptop["name"]!, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                          SizedBox(height: 10),
                          Text(laptop["price"]!, style: TextStyle(color: Colors.red, fontSize: 25)),
                          SizedBox(height: 10),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.lightGreen,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                            ),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>details1()));
                            },
                            child: Text("Details", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
