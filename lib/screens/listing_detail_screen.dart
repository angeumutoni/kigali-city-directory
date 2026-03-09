import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/listing.dart';

class ListingDetailScreen extends StatelessWidget {
  final Listing listing;

  const ListingDetailScreen({super.key, required this.listing});

  void openNavigation() async {
    final url =
        "https://www.google.com/maps/dir/?api=1&destination=${listing.lat},${listing.lng}";

    await launchUrl(Uri.parse(url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(listing.name)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 250,
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(listing.lat, listing.lng),
                zoom: 15,
              ),
              markers: {
                Marker(
                  markerId: MarkerId(listing.id),
                  position: LatLng(listing.lat, listing.lng),
                  infoWindow: InfoWindow(title: listing.name),
                )
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(listing.name,
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold)),
                Text(listing.category),
                const SizedBox(height: 10),
                Text("Address: ${listing.address}"),
                Text("Phone: ${listing.phone}"),
                const SizedBox(height: 10),
                Text(listing.description),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: openNavigation,
                  child: const Text("Navigate with Google Maps"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}