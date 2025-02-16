import 'package:flutter/material.dart';
import 'package:shopify/widget/support_font.dart';

class TvPage extends StatefulWidget {
  const TvPage({super.key});

  @override
  State<TvPage> createState() => _TvPageState();
}

class _TvPageState extends State<TvPage> {
  TextEditingController searchController = TextEditingController();
  List<Map<String, String>> tvs = [
    {"name": "SkyWall", "price": "₹7999/-", "image": "assets/l1.webp"},
    {"name": "TCL", "price": "₹14099/-", "image": "assets/l2.webp"},
    {"name": "SAMSUNG", "price": "₹14999/-", "image": "assets/l3.webp"},
    {"name": "Acer", "price": "₹7999/-", "image": "assets/l4.webp"},
  ];

  List<Map<String, String>> filteredTvs = [];

  @override
  void initState() {
    super.initState();
    filteredTvs = tvs;
  }

  void searchTvs(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredTvs = tvs;
      } else {
        filteredTvs = tvs
            .where((tv) => tv["name"]!.toLowerCase().contains(query.toLowerCase()))
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
          child: Text("TV", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
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
                onChanged: searchTvs,
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
              itemCount: filteredTvs.length,
              itemBuilder: (context, index) {
                var tv = filteredTvs[index];
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Image.asset(tv["image"]!, width: 150),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(tv["name"]!, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                          SizedBox(height: 10),
                          Text(tv["price"]!, style: TextStyle(color: Colors.red, fontSize: 25)),
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
