import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopify/cart/cart_provider.dart';

class Details3 extends StatefulWidget {
  const Details3({super.key});

  @override
  State<Details3> createState() => _DetailsState();
}

class _DetailsState extends State<Details3> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      body: Container(
        padding: EdgeInsets.only(top: 50, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                margin: EdgeInsets.only(left: 20),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Icon(Icons.arrow_back_ios_new_outlined, color: Colors.black),
              ),
            ),
            Center(child: Image.asset("assets/l1.webp", height: 400)),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("TV", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                        Text("₹7999/-", style: TextStyle(color: Color(0xFFfd6f3e), fontSize: 22, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text("Details", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Text("TV (Television) is an electronic device used for receiving and displaying visual and audio content, such as movies, news, and entertainment programs. It works by receiving broadcast signals via satellite, cable, or the internet."),
                    SizedBox(height: 90),
                    GestureDetector(
                      onTap: () {
                        cartProvider.addToCart("TV", "₹7999/-", "assets/l1.webp");
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Added to Cart")),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text("Add to Cart", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
