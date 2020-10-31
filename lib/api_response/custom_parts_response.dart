class CustomPartsResponse {
  String sId;
  String title;
  String description;
  String modelNumber;
  String type;
  String thumbnailURL;
  int price;
  String createdAt;
  int iV;

  CustomPartsResponse(
      {this.sId,
      this.title,
      this.description,
      this.modelNumber,
      this.type,
      this.thumbnailURL,
      this.price,
      this.createdAt,
      this.iV});

  CustomPartsResponse.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    description = json['description'];
    modelNumber = json['modelNumber'];
    type = json['type'];
    thumbnailURL = json['thumbnailURL'];
    price = json['price'];
    createdAt = json['createdAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['modelNumber'] = this.modelNumber;
    data['type'] = this.type;
    data['thumbnailURL'] = this.thumbnailURL;
    data['price'] = this.price;
    data['createdAt'] = this.createdAt;
    data['__v'] = this.iV;
    return data;
  }
}
