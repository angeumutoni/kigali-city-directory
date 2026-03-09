import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/listing.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<List<Listing>> getListings() {
    return _db.collection('listings').snapshots().map((snapshot) => snapshot
        .docs
        .map((doc) => Listing.fromMap(doc.data(), doc.id))
        .toList());
  }

  Future<void> addListing(Listing listing) async {
    await _db
        .collection('listings')
        .add({...listing.toMap(), 'timestamp': Timestamp.now()});
  }

  Future<void> deleteListing(String id) async {
    await _db.collection('listings').doc(id).delete();
  }

  Future<void> updateListing(Listing listing) async {
    await _db.collection('listings').doc(listing.id).update(listing.toMap());
  }
}