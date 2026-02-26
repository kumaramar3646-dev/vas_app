import '../db_helper.dart';

class SaleChallanModel {
  int? id;
  String customerName;
  String? category;
  String? transport;
  String? discount;
  String ChallanDate;
  String challanNo;
  String AddItem;

  SaleChallanModel({this.id, required this.customerName, this.category, this.transport, this.discount, required this.ChallanDate, required this.challanNo, required this.AddItem});

  factory SaleChallanModel.fromMap(Map<String, dynamic> map) {
    return SaleChallanModel(
        customerName: map[DbHelper.customerName],
        category: map[DbHelper.category],
        transport: map[DbHelper.transport],
        discount: map[DbHelper.discount],
        ChallanDate: map[DbHelper.ChallanDate],
        challanNo: map[DbHelper.challanNo],
        AddItem: map[DbHelper.AddItem],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      DbHelper.customerName: customerName,
      DbHelper.category: category,
      DbHelper.transport: transport,
      DbHelper.discount: discount,
      DbHelper.ChallanDate: ChallanDate,
      DbHelper.challanNo: challanNo,
      DbHelper.AddItem: AddItem,
    };
    }


}

