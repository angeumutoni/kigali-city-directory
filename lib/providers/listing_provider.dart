import 'package:flutter/material.dart';
import '../models/listing.dart';
import '../services/firestore_service.dart';

class ListingProvider extends ChangeNotifier {
  final FirestoreService _service = FirestoreService();

  List<Listing> listings = [];

  void listenToListings() {
    _service.getListings().listen((data) {
      listings = data;
      notifyListeners();
    });
  }

  Future<void> addListing(Listing listing) async {
    await _service.addListing(listing);
  }

  Future<void> deleteListing(String id) async {
    await _service.deleteListing(id);
  }
}