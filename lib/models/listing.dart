class Listing {
  String id;
  String name;
  String category;
  String address;
  String phone;
  String description;
  double lat;
  double lng;
  String createdBy;

  Listing({
    required this.id,
    required this.name,
    required this.category,
    required this.address,
    required this.phone,
    required this.description,
    required this.lat,
    required this.lng,
    required this.createdBy,
  });

  factory Listing.fromMap(Map<String, dynamic> data, String id) {
    return Listing(
      id: id,
      name: data['name'],
      category: data['category'],
      address: data['address'],
      phone: data['phone'],
      description: data['description'],
      lat: data['lat'],
      lng: data['lng'],
      createdBy: data['createdBy'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'category': category,
      'address': address,
      'phone': phone,
      'description': description,
      'lat': lat,
      'lng': lng,
      'createdBy': createdBy,
    };
  }
}
