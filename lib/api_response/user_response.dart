class UserResponse {
  CustomBuild customBuild;
  String sId;
  String name;
  String mobile;
  String email;
  String username;
  String password;
  String createdAt;
  int iV;

  UserResponse(
      {this.customBuild,
      this.sId,
      this.name,
      this.mobile,
      this.email,
      this.username,
      this.password,
      this.createdAt,
      this.iV});

  UserResponse.fromJson(Map<String, dynamic> json) {
    customBuild = json['customBuild'] != null
        ? new CustomBuild.fromJson(json['customBuild'])
        : null;
    sId = json['_id'];
    name = json['name'];
    mobile = json['mobile'];
    email = json['email'];
    username = json['username'];
    password = json['password'];
    createdAt = json['createdAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.customBuild != null) {
      data['customBuild'] = this.customBuild.toJson();
    }
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['username'] = this.username;
    data['password'] = this.password;
    data['createdAt'] = this.createdAt;
    data['__v'] = this.iV;
    return data;
  }
}

class CustomBuild {
  String processor;
  String gpu;
  String motherboard;
  String ram;
  String ssd;
  String hdd;
  String smps;
  String cabinet;
  String cards;
  String fans;
  String others;
  int price;

  CustomBuild(
      {this.processor,
      this.gpu,
      this.motherboard,
      this.ram,
      this.ssd,
      this.hdd,
      this.smps,
      this.cabinet,
      this.cards,
      this.fans,
      this.others,
      this.price});

  CustomBuild.fromJson(Map<String, dynamic> json) {
    processor = json['processor'];
    gpu = json['gpu'];
    motherboard = json['motherboard'];
    ram = json['ram'];
    ssd = json['ssd'];
    hdd = json['hdd'];
    smps = json['smps'];
    cabinet = json['cabinet'];
    cards = json['cards'];
    fans = json['fans'];
    others = json['others'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['processor'] = this.processor;
    data['gpu'] = this.gpu;
    data['motherboard'] = this.motherboard;
    data['ram'] = this.ram;
    data['ssd'] = this.ssd;
    data['hdd'] = this.hdd;
    data['smps'] = this.smps;
    data['cabinet'] = this.cabinet;
    data['cards'] = this.cards;
    data['fans'] = this.fans;
    data['others'] = this.others;
    data['price'] = this.price;
    return data;
  }
}
