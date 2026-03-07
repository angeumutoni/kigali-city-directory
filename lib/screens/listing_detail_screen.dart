```dart
import 'package:flutter/material.dart';
import '../models/listing.dart';

class ListingDetailScreen extends StatelessWidget {

  final Listing listing;

  const ListingDetailScreen({super.key, required this.listing});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text(listing.name)),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Container(
              height: 150,
              color: Colors.grey[300],
              child: const Center(child: Icon(Icons.image, size: 50)),
            ),

            const SizedBox(height: 20),

            Text(listing.name,
                style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold)),

            Text(listing.category),

            const SizedBox(height: 20),

            const Text("Reviews",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),

            const SizedBox(height: 10),

            const ListTile(
              title: Text("Eric"),
              subtitle: Text("Great coffee and friendly staff."),
            ),

            const ListTile(
              title: Text("Sarah"),
              subtitle: Text("Relaxing atmosphere."),
            ),

            const Spacer(),

            ElevatedButton(
              onPressed: () {},
              child: const Text("Rate this service"),
            )
          ],
        ),
      ),
    );
  }
}
```
