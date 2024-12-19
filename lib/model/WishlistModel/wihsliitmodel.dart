class Wihsliitmodel {
  String? statues;
  List<WishlistData>? data;

  Wihsliitmodel({required this.data, required this.statues});
  factory Wihsliitmodel.fromJson(Map<String, dynamic> json) {
    return Wihsliitmodel(
        data: (json['data'] as List)
            .map((i) => WishlistData.fromJson(i))
            .toList(),
        statues: json['status']);
  }
}

class WishlistData {
  String? id;
  String? title;
  String? categorey;
  String? src;
  String? link;
  List<String>? template;
  String? productName;
  num? actualPrice;
  String? size;
  List<String>? productDescription;
  num? sideimg;

  WishlistData(
      {required this.actualPrice,
      required this.title,
      required this.categorey,
      required this.link,
      required this.productDescription,
      required this.productName,
      required this.sideimg,
      required this.size,
      required this.src,
      required this.template,
      this.id});

  factory WishlistData.fromJson(Map<String, dynamic> json) {
    return WishlistData(
        id: json['_id'],
        actualPrice: json['actualPrice'],
        title: json['title'],
        categorey: json['category'],
        link: json['link'],
        productDescription: List<String>.from(json['productDescription']),
        productName: json['productName'],
        sideimg: json['sideImg'],
        size: json['size'],
        src: json['src'],
        template: List<String>.from(json['template']));
  }
}
