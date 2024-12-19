class ProdectModels {
  String? status;
  List<Data>? data;
  ProdectModels({required this.data, required this.status});

  factory ProdectModels.fromJson(Map<String, dynamic> json) {
    return ProdectModels(
        data: (json['data'] as List).map((i) => Data.fromJson(i)).toList(),
        status: json['status']);
  }
}

class Data {
  String? id;
  String? title;
  String? category;
  String? src;
  String? link;
  List<String>? template;
  String? productName;
  num? actualPrice;
  String? weight;
  String? size;
  List<String>? productDescription;
  num? sideImg;

  Data(
      {required this.id,
      required this.actualPrice,
      required this.category,
      required this.link,
      required this.productDescription,
      required this.productName,
      required this.sideImg,
      required this.size,
      required this.src,
      required this.template,
      required this.title,
      required this.weight});
  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
        id: json['_id'],
        actualPrice: json['actualPrice'],
        category: json['category'],
        link: json['link'],
        productDescription: List<String>.from(json['productDescription']),
        productName: json['productName'],
        sideImg: json['sideImg'],
        size: json['size'],
        src: json['src'],
        template: List<String>.from(json['template']),
        title: json['title'],
        weight: json['weight']);
  }
}
