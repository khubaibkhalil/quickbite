// bottom_navigation_bar.dart
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      //currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.black,
      elevation: 5,
      selectedItemColor: Colors.white, // Color for both selected and unselected items
      unselectedItemColor: Colors.white, // Same color for both selected and unselected items

      // Customizing each BottomNavigationBarItem
      items: [
        _buildBottomNavigationBarItem(Icons.home, 'Home'),
        _buildBottomNavigationBarItem(Icons.restaurant_menu, 'Menu'),
        _buildBottomNavigationBarItem(Icons.person, 'Admin'),
        _buildBottomNavigationBarItem(Icons.local_offer, 'Promotions'),
        _buildBottomNavigationBarItem(Icons.list, 'Product List'),
        _buildBottomNavigationBarItem(Icons.settings, 'Settings'),
      ],
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(
      IconData icon, String label) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
      backgroundColor: Colors.orange,
    );
  }
}

void handleBottomNavigationTap(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/home');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/menu');
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/admin');
        break;
      case 3:
        Navigator.pushReplacementNamed(context, '/promotions');
        break;
      case 4:
        Navigator.pushReplacementNamed(context, '/productlist');
        break;
      case 5:
        Navigator.pushReplacementNamed(context, '/settings');
        break;
    }
  }
