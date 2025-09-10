import 'package:ar_menu_app/Constants/string_constants.dart';

class MenuItem {
  String id;
  String name;
  String description;
  String category;
  double price;
  double rate;
  String type;
  String image;

  MenuItem({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.price,
    required this.rate,
    required this.type,
    required this.image,
  });

  factory MenuItem.fromJson(Map<String, dynamic> jsonObject) {
    return MenuItem(
      id: jsonObject['id'],
      name: jsonObject['name'],
      description: jsonObject['description'],
      category: jsonObject['category'],
      price: jsonObject['price'] != null
          ? (jsonObject['price'] as num).toDouble()
          : 0.0,
      rate: jsonObject['rate'] != null
          ? (jsonObject['rate'] as num).toDouble()
          : 0.0,
      type: jsonObject['type'],
      image:
          '${StringConstants.baseUrl}files/${jsonObject['collectionId']}/${jsonObject['id']}/${jsonObject['image']}',
    );
  }
}
