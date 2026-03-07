import 'package:flutter/material.dart';
import '../models/listing.dart';
import '../services/local_listing_service.dart';

class ListingProvider extends ChangeNotifier {
  final LocalListingService _service = LocalListingService();

  List<Listing> get listings => _service.getListings();

  void addListing(Listing listing) {
    _service.addListing(listing);
    notifyListeners();
  }

  void deleteListing(String id) {
    _service.deleteListing(id);
    notifyListeners();
  }

  void updateListing(Listing listing) {
    _service.updateListing(listing);
    notifyListeners();
  }
}
