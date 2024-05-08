import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

// ignore: must_be_immutable
class MyBottomNavBar extends StatelessWidget {
  void Function(int)? onTabChange;
  MyBottomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: GNav(
        color: const Color.fromARGB(255, 0, 0, 0),
        activeColor: const Color.fromARGB(255, 0, 0, 0),
        tabActiveBorder: Border.all(color: Colors.white),
        tabBackgroundColor: const Color.fromARGB(255, 88, 85, 85),
        mainAxisAlignment: MainAxisAlignment.center,
        tabBorderRadius: 16,
        gap: 8,
        onTabChange: (value) => onTabChange!(value),
        tabs: const [
          GButton(
            icon: Icons.home,
            text: '  Home',
          ),
          GButton(
            icon: Icons.shopping_cart,
            text: '  Cart',
          ),
          GButton(
            icon: Icons.message,
            text: '  Messages',
          ),
          GButton(
            icon: Icons.map,
            text: '  Map',
          ),
        ],
      ),
    );
  }
}