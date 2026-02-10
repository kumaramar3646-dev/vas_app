import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

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
  // $colCustomerId integer primary key autoincrement,
   //static const String colCustomerId = "customerId";
   static const String colCustomerGst = "customerGst";
   static const String colCustomerName = "customerName";
   static const String colAccountType = "customerAccountType";
   static const String colCustomerAddress1 = "customerAddress1";
   static const String colCustomerAddress2 = "customerAddress2";
   static const String colCustomerCity = "customerCity";
   static const String colCustomerPinCode = "customerPinCode";
   static const String colCustomerState = "customerState";
   static const String colCustomerDistance = "customerDistance";
   static const String colCustomerMobile = "customerMobile";
   static const String colCustomerEmail = "customerEmail";
   static const String colCustomerTransport = "customerTransport";
   static const String colCustomerDiscount = "customerDiscount";

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
      db.execute("create table $tblCustomer( $colCustomerGst text, $colCustomerName text, $colAccountType text, $colCustomerAddress1 text, $colCustomerAddress2 text, $colCustomerCity text, $colCustomerPinCode text, $colCustomerState text, $colCustomerDistance text, $colCustomerMobile text, $colCustomerEmail text, $colCustomerTransport text, $colCustomerDiscount text)");
      }
     );
   }
    Future<bool> addCustomer({
      required String colCustomerGst,
      required String colCustomerName,
      required String colAccountType,
      required String colCustomerAddress1,
      required String colCustomerAddress2,
      required String colCustomerCity,
      required String colCustomerPinCode,
      required String colCustomerState,
      required String colCustomerDistance,
      required String colCustomerMobile,
      required String colCustomerEmail,
      required String colCustomerTransport,
      required String colCustomerDiscount,

    })async{
     var db = await initDB();
     int rowEffected = await db.insert(tblCustomer, {
       colCustomerGst: colCustomerGst,
       colCustomerName: colCustomerName,
       colAccountType: colAccountType,
       colCustomerAddress1: colCustomerAddress1,
       colCustomerAddress2: colCustomerAddress2,
       colCustomerCity: colCustomerCity,
       colCustomerPinCode: colCustomerPinCode,
       colCustomerState: colCustomerState,
       colCustomerDistance: colCustomerDistance,
       colCustomerMobile: colCustomerMobile,
       colCustomerEmail: colCustomerEmail,
       colCustomerTransport: colCustomerTransport,
       colCustomerDiscount: colCustomerDiscount,
     });
      return rowEffected > 0;
   }

   Future<List<Map<String, dynamic?>>> getAllCustomer()async{
    var db = await initDB();
    return db.query(tblCustomer);
   }

  }