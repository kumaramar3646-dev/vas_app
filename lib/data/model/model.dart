import 'package:vas_app/data/db_helper.dart';

class CustomerModel {
  final int? id;
  final String? gstNumber;
  final String name; // REQUIRED
  final String? customerAccountType;
  final String? address1;
  final String? address2;
  final String? city;
  final int? pinCode;
  final String? state;
  final int? distance;
  final String? mobNumber;
  final String? email;
  final String? transport;
  final int? discount;

  CustomerModel({
    this.id,
    required this.name,
    this.gstNumber,
    this.customerAccountType,
    this.address1,
    this.address2,
    this.city,
    this.pinCode,
    this.state,
    this.distance,
    this.mobNumber,
    this.email,
    this.transport,
    this.discount,
  });

  factory CustomerModel.fromMap(Map<String, dynamic> map) {
    return CustomerModel(
      id: map[DbHelper.colCustomerId],
      name: map[DbHelper.colCustomerName],
      gstNumber: map[DbHelper.colCustomerGst],
      customerAccountType: map[DbHelper.colAccountType],
      address1: map[DbHelper.colCustomerAddress1],
      address2: map[DbHelper.colCustomerAddress2],
      city: map[DbHelper.colCustomerCity],
      pinCode: map[DbHelper.colCustomerPinCode],
      state: map[DbHelper.colCustomerState],
      distance: map[DbHelper.colCustomerDistance],
      mobNumber: map[DbHelper.colCustomerMobile],
      email: map[DbHelper.colCustomerEmail],
      transport: map[DbHelper.colCustomerTransport],
      discount: map[DbHelper.colCustomerDiscount],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      DbHelper.colCustomerName: name,
      DbHelper.colCustomerGst: gstNumber,
      DbHelper.colAccountType: customerAccountType,
      DbHelper.colCustomerAddress1: address1,
      DbHelper.colCustomerAddress2: address2,
      DbHelper.colCustomerCity: city,
      DbHelper.colCustomerPinCode: pinCode,
      DbHelper.colCustomerState: state,
      DbHelper.colCustomerDistance: distance,
      DbHelper.colCustomerMobile: mobNumber,
      DbHelper.colCustomerEmail: email,
      DbHelper.colCustomerTransport: transport,
      DbHelper.colCustomerDiscount: discount,
    };
  }
  }



