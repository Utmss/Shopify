import 'package:flutter/material.dart';
import 'package:shopify/details/heaphone_detail.dart';
import 'package:shopify/widget/support_font.dart';

class HeadphonePage extends StatefulWidget {
  const HeadphonePage({super.key});

  @override
  State<HeadphonePage> createState() => _HeadphonePageState();
}

class _HeadphonePageState extends State<HeadphonePage> {
  TextEditingController searchController = TextEditingController();
  List<Map<String, String>> headphones = [
    {"name": "Zebronics", "price": "₹799/-", "image": "assets/headphone.png"},
    {"name": "Boult", "price": "₹799/-", "image": "assets/h1.webp"},
    {"name": "Sony", "price": "₹799/-", "image": "assets/h2.webp"},
    {"name": "JBL", "price": "₹799/-", "image": "assets/h3.webp"},
    {"name": "Sony", "price": "₹799/-", "image": "assets/h4.webp"},
  ];

  List<Map<String, String>> filteredHeadphones = [];

  @override
  void initState() {
    super.initState();
    filteredHeadphones = headphones;
  }

  void searchHeadphones(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredHeadphones = headphones;
      } else {
        filteredHeadphones = headphones
            .where((headphone) =>
                headphone["name"]!.toLowerCase().contains(query.toLowerCase()))
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
          child: Text("Headphones", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
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
                onChanged: searchHeadphones,
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
              itemCount: filteredHeadphones.length,
              itemBuilder: (context, index) {
                var headphone = filteredHeadphones[index];
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Image.asset(headphone["image"]!, width: 150),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(headphone["name"]!, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                          SizedBox(height: 10),
                          Text(headphone["price"]!, style: TextStyle(color: Colors.red, fontSize: 25)),
                          SizedBox(height: 10),
                           SizedBox(height: 10),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.lightGreen,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                            ),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>details()));
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
