// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:shopify/pages/home.dart';
// import 'package:shopify/pages/order.dart';
// import 'package:shopify/pages/profile.dart';
// import 'package:shopify/widget/theme_provider.dart';

// class BottomNav extends StatefulWidget {
//   const BottomNav({super.key});

//   @override
//   State<BottomNav> createState() => _BottomNavState();
// }

// class _BottomNavState extends State<BottomNav> {
//   late List<Widget> pages;
//   late home homePage;
//   late CartPage order;
//   late Profile profile;
//   int currentIndexTab = 0;

//   @override
//   void initState() {
//     homePage = home();
//     order = CartPage(itemName: "TV", itemPrice: "9387", itemImage: "assets/l1.webp");
//     profile = Profile();
//     pages = [homePage, order, profile];
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final themeProvider = Provider.of<ThemeProvider>(context);

//     return Scaffold(
//       bottomNavigationBar: CurvedNavigationBar(
//         height: 65,
//         backgroundColor: themeProvider.isDarkMode ? Colors.black : Color(0xfff2f2f2), // Changes theme color dynamically
//         color: themeProvider.isDarkMode ? Colors.grey[900]! : Colors.white, // Adjust color in dark mode
//         animationDuration: Duration(milliseconds: 500),
//         onTap: (int index) {
//           setState(() {
//             currentIndexTab = index;
//           });
//         },
//         items: [
//           Icon(Icons.home_outlined, color: themeProvider.isDarkMode ? Colors.white : Colors.black),
//           Icon(Icons.shopping_bag_outlined, color: themeProvider.isDarkMode ? Colors.white : Colors.black),
//           Icon(Icons.person_outlined, color: themeProvider.isDarkMode ? Colors.white : Colors.black),
//         ],
//       ),
//       body: pages[currentIndexTab],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopify/pages/home.dart';
import 'package:shopify/pages/order.dart';
import 'package:shopify/pages/profile.dart';


class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentIndexTab = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [home(), CartPage(), Profile()];

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndexTab,
        onTap: (index) {
          setState(() {
            currentIndexTab = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined), label: "Cart"),
          BottomNavigationBarItem(icon: Icon(Icons.person_outlined), label: "Profile"),
        ],
      ),
      body: pages[currentIndexTab],
    );
  }
}
