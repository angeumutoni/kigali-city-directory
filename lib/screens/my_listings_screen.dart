```dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/listing_provider.dart';
import 'create_listing_screen.dart';

class MyListingsScreen extends StatelessWidget {
  const MyListingsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final listings = context.watch<ListingProvider>().listings;

    return Scaffold(
      appBar: AppBar(title: const Text("Bookmarks")),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const CreateListingScreen(),
            ),
          );
        },
      ),

      body: ListView.builder(
        itemCount: listings.length,
        itemBuilder: (context, index) {

          final listing = listings[index];

          return ListTile(
            title: Text(listing.name),
            subtitle: Text(listing.category),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                context.read<ListingProvider>().deleteListing(listing.id);
              },
            ),
          );
        },
      ),
    );
  }
}
```
