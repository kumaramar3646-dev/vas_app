
 import '../data/model/model.dart';

abstract class MasterState {}

 class MasterInitialState extends MasterState{}
 class MasterLoadingState extends MasterState{}
 class MasterLoadedState extends MasterState{
   final List<CustomerModel> addCustomerState;
   MasterLoadedState({required this.addCustomerState});
 }
 class MasterErrorState extends MasterState{
   final String error;
   MasterErrorState({required this.error});

 }