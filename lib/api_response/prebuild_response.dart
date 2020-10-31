class PreBuildResponse {
  String sId;
  String buildname;
  String thumnailurl;
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
  int price;
  List<String> buildImagesURL;
  String createdAt;
  int iV;

  PreBuildResponse(
      {this.sId,
      this.buildname,
      this.thumnailurl,
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
      this.buildImagesURL,
      this.createdAt,
      this.iV});

  PreBuildResponse.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    buildname = json['buildname'];
    thumnailurl = json['thumbnailURL'];
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
    buildImagesURL = json['buildImagesURL'].cast<String>();
    createdAt = json['createdAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['buildname'] = this.buildname;
    data['thumnailURL'] = this.thumnailurl;
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
    data['buildImagesURL'] = this.buildImagesURL;
    data['createdAt'] = this.createdAt;
    data['__v'] = this.iV;
    return data;
  }
}
