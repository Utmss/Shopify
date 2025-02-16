import 'package:flutter/material.dart';
import 'package:shopify/widget/support_font.dart';

class WatchPage extends StatefulWidget {
  const WatchPage({super.key});

  @override
  State<WatchPage> createState() => _WatchPageState();
}

class _WatchPageState extends State<WatchPage> {
  TextEditingController searchController = TextEditingController();
  List<Map<String, String>> watches = [
    {"name": "Apple Watch", "price": "₹1499/-", "image": "assets/watch2.png"},
    {"name": "Titan", "price": "₹1199/-", "image": "assets/watch3.webp"},
    {"name": "Olevs", "price": "₹3800/-", "image": "assets/watch4.webp"},
    {"name": "Timex", "price": "₹1269/-", "image": "assets/watch5.webp"},
    {"name": "Sonata", "price": "₹1185/-", "image": "assets/watch6.webp"},
  ];

  List<Map<String, String>> filteredWatches = [];

  @override
  void initState() {
    super.initState();
    filteredWatches = watches;
  }

  void searchWatches(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredWatches = watches;
      } else {
        filteredWatches = watches
            .where((watch) => watch["name"]!.toLowerCase().contains(query.toLowerCase()))
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
          child: Text("Watch", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
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
                onChanged: searchWatches,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search Watches",
                  hintStyle: Appwidget.lighttextfieldstyle(),
                  prefixIcon: Icon(Icons.search, color: Colors.black),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredWatches.length,
              itemBuilder: (context, index) {
                var watch = filteredWatches[index];
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Image.asset(watch["image"]!, width: 150),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(watch["name"]!, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                          SizedBox(height: 10),
                          Text(watch["price"]!, style: TextStyle(color: Colors.red, fontSize: 25)),
                          SizedBox(height: 10),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.lightGreen,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                            ),
                            onPressed: () {},
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