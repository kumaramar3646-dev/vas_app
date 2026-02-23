import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vas_app/data/db_helper.dart';
import 'package:vas_app/data/model/model.dart';
import 'add_master_event.dart';
import 'add_master_state.dart';

class MasterBloc extends Bloc<MasterEvent, MasterState> {

  final DbHelper dbHelper;

  MasterBloc({required this.dbHelper}) : super(MasterInitialState()) {

    on<AddMasterEvent>((event, emit) async {

      emit(MasterLoadingState());

      try {
        // Add customer
        bool isAdded = await dbHelper.addCustomer(
          addNewCustomer: event.addCustomerEvent,
        );

        if (isAdded) {
          // Fetch customers after adding
          List<Map<String, dynamic>> customers = await dbHelper.getAllCustomer();

          //  Convert to Model
          List<CustomerModel> customerList = customers.map((data) {
            return CustomerModel(
              gstNumber: data['customerGst'],
              name: data['customerName'] ?? '',
              customerAccountType: data['AccountType'],
              address1: data['customerAddress1'],
              address2: data['customerAddress2'],
              city: data['customerCity'],
              pinCode: data['customerPinCode'],
              state: data['customerState'],
              distance: data['customerDistance'],
              mobNumber: data['customerMobile'],
              email: data['customerEmail'],
              transport: data['customerTransport'],
              discount: data['customerDiscount'],
            );
          }).toList();

          // Emit loaded state with fresh data
          emit(MasterLoadedState(addCustomerState: customerList));

        } else {
          emit(MasterErrorState(error: "Failed to add customer"));
        }

      } catch (e) {
        emit(MasterErrorState(error: e.toString()));
      }
    });

      }







}