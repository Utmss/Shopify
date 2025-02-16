import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopify/cart/cart_provider.dart';


class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        
        title: Text("Cart",style: TextStyle(fontWeight: FontWeight.bold),),
        backgroundColor: Colors.white,
      ),
      body: cartProvider.cartItems.isEmpty
          ? Center(child: Text("Your cart is empty   \n     Please add",style: TextStyle(fontSize: 24),))
          : ListView.builder(
              padding: EdgeInsets.all(20),
              itemCount: cartProvider.cartItems.length,
              itemBuilder: (context, index) {
                final item = cartProvider.cartItems[index];

                return Card(
                  margin: EdgeInsets.only(bottom: 10),
                  child: ListTile(
                    leading: Image.asset(item['image']!, height: 50, width: 50, fit: BoxFit.cover),
                    title: Text(item['name']!, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    subtitle: Text(item['price']!, style: TextStyle(fontSize: 16, color: Colors.orange)),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        cartProvider.removeFromCart(index);
                      },
                    ),
                  ),
                );
              },
            ),
      bottomNavigationBar: cartProvider.cartItems.isNotEmpty
          ? Padding(
              padding: EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: () {
                  cartProvider.clearCart();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Checkout successful!")),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: Text("Checkout", style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            )
          : null,
    );
  }
}
