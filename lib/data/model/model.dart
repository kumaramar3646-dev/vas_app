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

  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
      id: json['id'],
      name: json['CustomerName'],
      gstNumber: json['GstNumber'],
      customerAccountType: json['CustomerAccountType'],
      address1: json['Address1'],
      address2: json['Address2'],
      city: json['City'],
      pinCode: json['PinCode'],
      state: json['State'],
      distance: json['Distance'],
      mobNumber: json['MobNumber'],
      email: json['Email'],
      transport: json['TransPort'],
      discount: json['Discount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'CustomerName': name,
      'GstNumber': gstNumber,
      'CustomerAccountType': customerAccountType,
      'Address1': address1,
      'Address2': address2,
      'City': city,
      'PinCode': pinCode,
      'State': state,
      'Distance': distance,
      'MobNumber': mobNumber,
      'Email': email,
      'TransPort': transport,
      'Discount': discount,
    };
  }
}
