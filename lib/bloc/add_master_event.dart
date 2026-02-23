
  import 'package:vas_app/data/model/model.dart';

abstract class MasterEvent {}

  class AddMasterEvent extends MasterEvent{

    CustomerModel addCustomerEvent;

    AddMasterEvent({required this.addCustomerEvent});
    }

  class GetMasterEvent extends MasterEvent{
    int filter;
    GetMasterEvent({this.filter = 0});
  }

