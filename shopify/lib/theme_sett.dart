import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopify/widget/theme_provider.dart';

class ThemeSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Theme Settings",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        backgroundColor: themeProvider.isDarkMode ? Colors.black : Colors.orange,
        elevation: 3,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: themeProvider.isDarkMode ? Colors.grey[900] : Colors.grey[200],
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 8,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  themeProvider.isDarkMode ? Icons.dark_mode : Icons.light_mode,
                  size: 50,
                  color: themeProvider.isDarkMode ? Colors.orange : Colors.black,
                ),
                SizedBox(height: 15),
                Text(
                  "Choose Theme",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 10),
                Divider(),
                SwitchListTile(
                  title: Text(
                    themeProvider.isDarkMode ? "Dark Mode" : "Light Mode",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  secondary: Icon(
                    themeProvider.isDarkMode ? Icons.nights_stay : Icons.wb_sunny,
                    color: themeProvider.isDarkMode ? Colors.orange : Colors.blue,
                  ),
                  value: themeProvider.isDarkMode,
                  onChanged: (value) {
                    themeProvider.toggleTheme(value);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
