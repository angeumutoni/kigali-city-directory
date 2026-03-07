```dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/listing_provider.dart';
import '../widgets/listing_card.dart';
import 'listing_detail_screen.dart';
import 'my_listings_screen.dart';
import 'map_screen.dart';
import 'settings_screen.dart';

class DirectoryScreen extends StatefulWidget {
  const DirectoryScreen({super.key});

  @override
  State<DirectoryScreen> createState() => _DirectoryScreenState();
}

class _DirectoryScreenState extends State<DirectoryScreen> {

  int _index = 0;

  final categories = [
    "Cafés",
    "Pharmacies",
    "Hospitals",
    "Parks",
    "Restaurants"
  ];

  String selectedCategory = "Cafés";

  @override
  Widget build(BuildContext context) {

    final listings = context.watch<ListingProvider>().listings;

    final screens = [
      buildDirectory(listings),
      const MyListingsScreen(),
      const MapScreen(),
      const SettingsScreen(),
    ];

    return Scaffold(
      body: screens[_index],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (value) {
          setState(() {
            _index = value;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Services"),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: "Bookmarks"),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: "Map"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
    );
  }

  Widget buildDirectory(listings) {

    return SafeArea(
      child: Column(
        children: [

          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              "Kigali City",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),

          SizedBox(
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: categories.map((c) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: ChoiceChip(
                    label: Text(c),
                    selected: selectedCategory == c,
                    onSelected: (_) {
                      setState(() {
                        selectedCategory = c;
                      });
                    },
                  ),
                );
              }).toList(),
            ),
          ),

          const Padding(
            padding: EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search for a service",
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),

          const Padding(
            padding: EdgeInsets.only(left: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Near You",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: listings.length,
              itemBuilder: (context, index) {

                final listing = listings[index];

                return ListingCard(
                  listing: listing,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ListingDetailScreen(listing: listing),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
```
