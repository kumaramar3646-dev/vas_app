import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:vas_app/data/model/model.dart';

class DbHelper {

  DbHelper._();

  static final DbHelper _instance = DbHelper._();

  static DbHelper getInstance() {
    return _instance;
  }

  Database? mDB;

  /// Database name
   static const String DBName = "vasAppDB.db";

   /// customer table
   static const String tblCustomer = "customer";
   /// customer table column

   static String colCustomerId = "customerId";
   static String colCustomerGst = "customerGst";
   static String colCustomerName = "customerName";
   static String colAccountType = "AccountType";
   static String colCustomerAddress1 = "customerAddress1";
   static String colCustomerAddress2 = "customerAddress2";
   static String colCustomerCity = "customerCity";
   static String colCustomerPinCode = "customerPinCode";
   static String colCustomerState = "customerState";
   static String colCustomerDistance = "customerDistance";
   static String colCustomerMobile = "customerMobile";
   static String colCustomerEmail = "customerEmail";
   static String colCustomerTransport = "customerTransport";
   static String colCustomerDiscount = "customerDiscount";

  Future<Database> initDB()async{

  mDB ??= await openDB();
  return mDB!;

  }
  Future<Database> openDB()async{
    Directory appDir = await getApplicationDocumentsDirectory();
    String dbPath = join(appDir.path, DBName);
    return await openDatabase(dbPath, version: 1, onCreate: (db, version){
      /// create all table here
      ///Customer table
      db.execute("create table $tblCustomer($colCustomerId integer primary key autoincrement, $colCustomerGst text, $colCustomerName text, $colAccountType text, $colCustomerAddress1 text, $colCustomerAddress2 text, $colCustomerCity text, $colCustomerPinCode text, $colCustomerState text, $colCustomerDistance text, $colCustomerMobile text, $colCustomerEmail text, $colCustomerTransport text, $colCustomerDiscount text)");
      }
     );
   }
    Future<bool> addCustomer({required CustomerModel addNewCustomer})async{
     var db = await initDB();
     int rowEffected = await db.insert(tblCustomer, addNewCustomer.toMap());
      return rowEffected > 0;
   }

   Future<List<Map<String, dynamic>>> getAllCustomer()async{
    var db = await initDB();
    return db.query(tblCustomer);
   }

    Future<bool> deleteCustomer(int customerId) async {
      var db = await initDB();
      int rowsAffected = await db.delete(
        tblCustomer,
        where: "$colCustomerId = ?", whereArgs: [customerId],
      );
      return rowsAffected > 0;
    }

  Future<bool> updateCustomerModel(CustomerModel customer) async {
    var db = await initDB();

    Map<String, dynamic> updateMap = {};

    if (customer.name.isNotEmpty) updateMap[colCustomerName] = customer.name;
    if (customer.gstNumber != null) updateMap[colCustomerGst] = customer.gstNumber;
    if (customer.customerAccountType != null) updateMap[colAccountType] = customer.customerAccountType;
    if (customer.address1 != null) updateMap[colCustomerAddress1] = customer.address1;
    if (customer.address2 != null) updateMap[colCustomerAddress2] = customer.address2;
    if (customer.city != null) updateMap[colCustomerCity] = customer.city;
    if (customer.pinCode != null) updateMap[colCustomerPinCode] = customer.pinCode;
    if (customer.state != null) updateMap[colCustomerState] = customer.state;
    if (customer.distance != null) updateMap[colCustomerDistance] = customer.distance;
    if (customer.mobNumber != null) updateMap[colCustomerMobile] = customer.mobNumber;
    if (customer.email != null) updateMap[colCustomerEmail] = customer.email;
    if (customer.transport != null) updateMap[colCustomerTransport] = customer.transport;
    if (customer.discount != null) updateMap[colCustomerDiscount] = customer.discount;

    if (updateMap.isEmpty || customer.id == null) return false;

    int rowsAffected = await db.update(
      tblCustomer,
      updateMap,
      where: "$colCustomerId = ?",
      whereArgs: [customer.id],
    );

    return rowsAffected > 0;
  }

  }