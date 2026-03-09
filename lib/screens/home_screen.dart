import 'package:flutter/material.dart';

import 'directory_screen.dart';
import 'create_listing_screen.dart';
import 'my_listings_screen.dart';
import 'settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    DirectoryScreen(),
    CreateListingScreen(),
    MyListingsScreen(),
    SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF1F2937), // dark background

        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,

        type: BottomNavigationBarType.fixed,

        currentIndex: _selectedIndex,
        onTap: _onItemTapped,

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Directory",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle),
            label: "Add Listing",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "My Listings",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}

