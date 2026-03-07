```dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import '../providers/listing_provider.dart';
import '../models/listing.dart';

class CreateListingScreen extends StatelessWidget {
  const CreateListingScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final name = TextEditingController();
    final category = TextEditingController();
    final address = TextEditingController();
    final contact = TextEditingController();
    final description = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Create Listing")),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            TextField(controller: name, decoration: const InputDecoration(labelText: "Name")),

            TextField(controller: category, decoration: const InputDecoration(labelText: "Category")),

            TextField(controller: address, decoration: const InputDecoration(labelText: "Address")),

            TextField(controller: contact, decoration: const InputDecoration(labelText: "Contact")),

            TextField(controller: description, decoration: const InputDecoration(labelText: "Description")),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {

                final listing = Listing(
                  id: const Uuid().v4(),
                  name: name.text,
                  category: category.text,
                  address: address.text,
                  contact: contact.text,
                  description: description.text,
                  latitude: 0,
                  longitude: 0,
                  createdBy: "localUser",
                  timestamp: DateTime.now(),
                );

                context.read<ListingProvider>().addListing(listing);

                Navigator.pop(context);
              },
              child: const Text("Save"),
            )
          ],
        ),
      ),
    );
  }
}
```
