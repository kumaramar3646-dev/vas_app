import 'package:vas_app/data/db_helper.dart';

class ItemModel {
  final int? id;
  final String designName; // REQUIRED
  final int? salePrice;
  final String? description;
  final String? designTags;

  ItemModel({this.id, required this.designName, this.salePrice, this.description, this.designTags});

  factory ItemModel.fromMap(Map<String, dynamic> map) {
    return ItemModel(
      id: map[DbHelper.colItemId],
      designName: map[DbHelper.designName],
      salePrice: map[DbHelper.salePrice],
      description: map[DbHelper.description],
      designTags: map[DbHelper.designTags],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      DbHelper.designName: designName,
      DbHelper.salePrice: salePrice,
      DbHelper.description: description,
      DbHelper.designTags: designTags,
    };
  }

}