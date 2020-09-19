class UserShowcaseResponse {
  String sId;
  String buildname;
  String customername;
  String customerContact;
  String thumbnailURL;
  String processor;
  String motherboard;
  String ram;
  String graphiccard;
  String ssd;
  String hdd;
  String psu;
  String cpucooler;
  String os;
  String cpucase;
  String price;
  String purchasedAt;
  String createdAt;
  int iV;

  UserShowcaseResponse(
      {this.sId,
      this.buildname,
      this.customername,
      this.customerContact,
      this.thumbnailURL,
      this.processor,
      this.motherboard,
      this.ram,
      this.graphiccard,
      this.ssd,
      this.hdd,
      this.psu,
      this.cpucooler,
      this.os,
      this.cpucase,
      this.price,
      this.purchasedAt,
      this.createdAt,
      this.iV});

  UserShowcaseResponse.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    buildname = json['buildname'];
    customername = json['customername'];
    customerContact = json['customerContact'];
    thumbnailURL = json['thumbnailURL'];
    processor = json['processor'];
    motherboard = json['motherboard'];
    ram = json['ram'];
    graphiccard = json['graphiccard'];
    ssd = json['ssd'];
    hdd = json['hdd'];
    psu = json['psu'];
    cpucooler = json['cpucooler'];
    os = json['os'];
    cpucase = json['cpucase'];
    price = json['price'];
    purchasedAt = json['purchasedAt'];
    createdAt = json['createdAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['buildname'] = this.buildname;
    data['customername'] = this.customername;
    data['customerContact'] = this.customerContact;
    data['thumbnailURL'] = this.thumbnailURL;
    data['processor'] = this.processor;
    data['motherboard'] = this.motherboard;
    data['ram'] = this.ram;
    data['graphiccard'] = this.graphiccard;
    data['ssd'] = this.ssd;
    data['hdd'] = this.hdd;
    data['psu'] = this.psu;
    data['cpucooler'] = this.cpucooler;
    data['os'] = this.os;
    data['cpucase'] = this.cpucase;
    data['price'] = this.price;
    data['purchasedAt'] = this.purchasedAt;
    data['createdAt'] = this.createdAt;
    data['__v'] = this.iV;
    return data;
  }
}
