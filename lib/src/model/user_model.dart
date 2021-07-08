class UserModel {
  bool? isAdmin;
  String? sId;
  String? name;
  String? email;
  int? phone;
  String? registrationDate;

  UserModel(
      {this.isAdmin,
      this.sId,
      this.name,
      this.email,
      this.phone,
      this.registrationDate});

  UserModel.fromJson(Map<String, dynamic> json) {
    isAdmin = json['isAdmin'];
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    registrationDate = json['registrationDate'];
  }

  UserModel.fromDb(Map<String, dynamic> json) {
    isAdmin = json['isAdmin'] == 1;
    sId = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    registrationDate = json['registrationDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['isAdmin'] = this.isAdmin;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['registrationDate'] = this.registrationDate;
    return data;
  }

  Map<String, dynamic> toDb() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['isAdmin'] = this.isAdmin == true ? 1 : 0;
    data['id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['registrationDate'] = this.registrationDate;
    return data;
  }
}
