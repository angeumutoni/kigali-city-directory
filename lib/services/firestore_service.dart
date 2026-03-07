import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/listing.dart';

class FirestoreService {

  final _db = FirebaseFirestore.instance;

  Stream<List<Listing>> getListings() {

    return _db.collection('listings')
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snapshot) {

      return snapshot.docs.map((doc) {

        final data = doc.data();

        return Listing(
          id: doc.id,
          name: data['name'],
          category: data['category'],
          address: data['address'],
          contact: data['contact'],
          description: data['description'],
          latitude: data['latitude'],
          longitude: data['longitude'],
          createdBy: data['createdBy'],
          timestamp: (data['timestamp'] as Timestamp).toDate(),
        );

      }).toList();
    });
  }

  Future<void> addListing(Listing listing) async {

    await _db.collection('listings').add({

      'name': listing.name,
      'category': listing.category,
      'address': listing.address,
      'contact': listing.contact,
      'description': listing.description,
      'latitude': listing.latitude,
      'longitude': listing.longitude,
      'createdBy': listing.createdBy,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  Future<void> deleteListing(String id) async {

    await _db.collection('listings').doc(id).delete();
  }

  Future<void> updateListing(Listing listing) async {

    await _db.collection('listings').doc(listing.id).update({

      'name': listing.name,
      'category': listing.category,
      'address': listing.address,
      'contact': listing.contact,
      'description': listing.description,
    });
  }
}
