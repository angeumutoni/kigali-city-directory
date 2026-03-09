import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DirectoryScreen extends StatefulWidget {
  const DirectoryScreen({super.key});

  @override
  State<DirectoryScreen> createState() => _DirectoryScreenState();
}

class _DirectoryScreenState extends State<DirectoryScreen> {
  String searchQuery = "";
  String selectedCategory = "All";

  final categories = [
    "All",
    "Hospital",
    "Police",
    "Café",
    "Shopping",
    "Tourist Attraction"
  ];

  void showDetails(BuildContext context, Map listing) {
    final address =
        listing['address'] ?? listing['location'] ?? "No address provided";

    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text(listing['name']),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Category: ${listing['category']}"),
              const SizedBox(height: 8),
              Text("Description: ${listing['description']}"),
              const SizedBox(height: 8),
              Text("Address: $address"),
              const SizedBox(height: 8),
              Text("Contact: ${listing['contact']}"),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Close"),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kigali Directory"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              decoration: const InputDecoration(
                hintText: "Search places...",
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value.toLowerCase();
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: DropdownButtonFormField(
              value: selectedCategory,
              items: categories.map((cat) {
                return DropdownMenuItem(
                  value: cat,
                  child: Text(cat),
                );
              }).toList(),
              onChanged: (val) {
                setState(() {
                  selectedCategory = val!;
                });
              },
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection("listings").snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }

                final listings = snapshot.data!.docs.where((doc) {
                  final data = doc.data() as Map;

                  final name = data['name'].toString().toLowerCase();

                  final category = data['category'];

                  final matchesSearch = name.contains(searchQuery);

                  final matchesCategory = selectedCategory == "All"
                      ? true
                      : category == selectedCategory;

                  return matchesSearch && matchesCategory;
                }).toList();

                if (listings.isEmpty) {
                  return const Center(
                    child: Text("No listings found"),
                  );
                }

                return ListView.builder(
                  itemCount: listings.length,
                  itemBuilder: (context, index) {
                    final listing = listings[index];

                    return Card(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      child: ListTile(
                        leading: const Icon(
                          Icons.place,
                          color: Colors.blue,
                        ),
                        title: Text(listing['name']),
                        subtitle: Text(listing['category']),
                        onTap: () {
                          showDetails(context, listing.data());
                        },
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