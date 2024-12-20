class Space {
  int id;
  String name;
  String imageUrl;
  int price;
  String city;
  String country;
  int rating;
  String address;
  String phone;
  String mapUrl;
  List<String> photos;
  int numberOfKitchens;
  int numberOfBedrooms;
  int numberOfCupboards;

  // Constructor dengan `required`
  Space({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.city,
    required this.country,
    required this.rating,
    required this.address,
    required this.phone,
    required this.mapUrl,
    required this.photos,
    required this.numberOfKitchens,
    required this.numberOfBedrooms,
    required this.numberOfCupboards,
  });

  // Constructor dari JSON
  Space.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? 0,
        name = json['name'] ?? '',
        city = json['city'] ?? '',
        country = json['country'] ?? '',
        price = json['price'] ?? 0,
        imageUrl = json['image_url'] ?? '',
        rating = json['rating'] ?? 0,
        address = json['address'] ?? '',
        phone = json['phone'] ?? '',
        mapUrl = json['map_url'] ?? '',
        photos =
            json['photos'] != null ? List<String>.from(json['photos']) : [],
        numberOfKitchens = json['number_of_kitchens'] ?? 0,
        numberOfBedrooms = json['number_of_bedrooms'] ?? 0,
        numberOfCupboards = json['number_of_cupboards'] ?? 0;
}
