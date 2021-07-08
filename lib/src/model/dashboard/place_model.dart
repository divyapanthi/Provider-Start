class PlaceModel {
  String? sId;
  String? name;
  String? city;
  String? street;
  String? address;
  String? image;
  String? description;
  String? monument;
  double? latitude;
  double? longitude;
  String? user;

  PlaceModel(
      {this.sId,
      this.name,
      this.city,
      this.street,
      this.address,
      this.image,
      this.description,
      this.monument,
      this.latitude,
      this.longitude,
      this.user});

  PlaceModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    city = json['city'];
    street = json['street'];
    address = json['address'];
    image = json['image'];
    description = json['description'];
    monument = json['monument'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['city'] = this.city;
    data['street'] = this.street;
    data['address'] = this.address;
    data['image'] = this.image;
    data['description'] = this.description;
    data['monument'] = this.monument;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['user'] = this.user;
    return data;
  }

  static List<PlaceModel> allResponse(data) {
    return data
        .cast<Map<String, dynamic>>()
        .map((e) => PlaceModel.fromJson(e))
        .toList()
        .cast<PlaceModel>();
  }
}


