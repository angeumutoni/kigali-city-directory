import '../models/listing.dart';

class LocalListingService {
  final List<Listing> _listings = [];

  List<Listing> getListings() {
    return _listings;
  }

  void addListing(Listing listing) {
    _listings.add(listing);
  }

  void deleteListing(String id) {
    _listings.removeWhere((listing) => listing.id == id);
  }

  void updateListing(Listing updatedListing) {
    int index =
        _listings.indexWhere((listing) => listing.id == updatedListing.id);

    if (index != -1) {
      _listings[index] = updatedListing;
    }
  }
}
