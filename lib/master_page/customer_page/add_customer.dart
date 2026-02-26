import 'package:flutter/material.dart';
import 'package:vas_app/data/db_helper.dart';

import '../../data/model/customer_model.dart';

class AddCustomer extends StatefulWidget {
  const AddCustomer({super.key});

  @override
  State<AddCustomer> createState() => _AddCustomerState();
}

  class _AddCustomerState extends State<AddCustomer> {

  List<Map<String, dynamic?>> mAddCustomer = [];

    DbHelper? dbHelper;
  @override
  void initState() {
    super.initState();
    dbHelper = DbHelper.getInstance();
    loadData();
  }
  loadData()async{
    mAddCustomer = await dbHelper!.getAllCustomer();
    setState(() {});
  }
    var GstNumberController = TextEditingController();
    var CustomerNameController = TextEditingController();
    var CustomerAccountTypeController = TextEditingController();
    var Address1Controller = TextEditingController();
    var Address2Controller = TextEditingController();
    var CityController = TextEditingController();
    var PinCodeController = TextEditingController();
    var StateController = TextEditingController();
    var DistanceController = TextEditingController();
    var MobNumberController = TextEditingController();
    var EmailController = TextEditingController();
    var TransPortController = TextEditingController();
    var DiscountController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Customer", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
        actions: [
          IconButton(onPressed: (){},
              icon: InkWell(
                  onTap: (){
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Search",
                        prefixIcon: Icon(Icons.search),
                      ),

                    );
                  },
                  child: Icon(Icons.search))),
        ],
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          mAddCustomer.isNotEmpty ? ListView.builder(
              itemCount: mAddCustomer.length,
              itemBuilder: (_, inex){
            return
              InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Card(
                child: ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       SizedBox(
                              width: 200,
                              //height: 40,
                              child: Text(mAddCustomer[inex]['customerName'] ?? "")),
                      SizedBox(width: 100,),
                      SizedBox(
                        width: 100,
                        child: Row(children: [
                          /// edit
                          IconButton(
                            onPressed: () {
                              // Bottom sheet open karna
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                builder: (context) {
                                  // TextFields populate
                                  GstNumberController.text = mAddCustomer[inex]['customerGst'] ?? "";
                                  CustomerNameController.text = mAddCustomer[inex]['customerName'] ?? "";
                                  CustomerAccountTypeController.text = mAddCustomer[inex]['AccountType'] ?? "";
                                  Address1Controller.text = mAddCustomer[inex]['customerAddress1'] ?? "";
                                  Address2Controller.text = mAddCustomer[inex]['customerAddress2'] ?? "";
                                  CityController.text = mAddCustomer[inex]['customerCity'] ?? "";
                                  PinCodeController.text = mAddCustomer[inex]['customerPinCode'] ?? "";
                                  StateController.text = mAddCustomer[inex]['customerState'] ?? "";
                                  DistanceController.text = mAddCustomer[inex]['customerDistance'] ?? "";
                                  MobNumberController.text = mAddCustomer[inex]['customerMobile'] ?? "";
                                  EmailController.text = mAddCustomer[inex]['customerEmail'] ?? "";
                                  TransPortController.text = mAddCustomer[inex]['customerTransport'] ?? "";
                                  DiscountController.text = mAddCustomer[inex]['customerDiscount'] ?? "";
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 51),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(horizontal: 11),
                                      child: Column(
                                        children: [
                                          Text("Edit Customer", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.blue)),
                                          SizedBox(height: 5),
                                          TextField(controller: CustomerNameController, decoration: InputDecoration(hintText: "Name")),
                                          SizedBox(height: 5),
                                          TextField(controller: GstNumberController, decoration: InputDecoration(hintText: "Gst Number")),
                                          SizedBox(height: 5),
                                          TextField(controller: CustomerAccountTypeController, decoration: InputDecoration(hintText: "Account Type")),
                                          SizedBox(height: 5),
                                          TextField(controller: Address1Controller, decoration: InputDecoration(hintText: "Address1")),
                                          SizedBox(height: 5),
                                          TextField(controller: Address2Controller, decoration: InputDecoration(hintText: "Address2")),
                                          SizedBox(height: 05),
                                          TextField(controller: CityController, decoration: InputDecoration(hintText: "City")),
                                          SizedBox(height: 05),
                                          TextField(controller: PinCodeController, decoration: InputDecoration(hintText: "PinCode")),
                                          SizedBox(height: 5),
                                          TextField(controller: StateController, decoration: InputDecoration(hintText: "State")),
                                          SizedBox(height: 5),
                                          TextField(controller: DistanceController, decoration: InputDecoration(hintText: "Distance")),
                                          SizedBox(height: 05),
                                          TextField(controller: MobNumberController, decoration: InputDecoration(hintText: "Mobile Number")),
                                          SizedBox(height: 5),
                                          TextField(controller: EmailController, decoration: InputDecoration(hintText: "Email")),
                                          SizedBox(height: 5),
                                          TextField(controller: TransPortController, decoration: InputDecoration(hintText: "Transport")),
                                          SizedBox(height: 5),
                                          TextField(controller: DiscountController, decoration: InputDecoration(hintText: "Discount")),
                                          SizedBox(height: 21),
                                          ElevatedButton(
                                            onPressed: () async {
                                              //  Update DB
                                              bool isUpdated = await DbHelper.getInstance().updateCustomerModel(
                                                CustomerModel(
                                                  id: mAddCustomer[inex]['customerId'],
                                                  name: CustomerNameController.text,
                                                  gstNumber: GstNumberController.text,
                                                  customerAccountType: CustomerAccountTypeController.text,
                                                  address1: Address1Controller.text,
                                                  address2: Address2Controller.text,
                                                  city: CityController.text,
                                                  pinCode: PinCodeController.text.isNotEmpty ? int.parse(PinCodeController.text) : null,
                                                  state: StateController.text,
                                                  distance: DistanceController.text.isNotEmpty ? int.parse(DistanceController.text) : null,
                                                  mobNumber: MobNumberController.text,
                                                  email: EmailController.text,
                                                  transport: TransPortController.text,
                                                  discount: DiscountController.text.isNotEmpty ? int.parse(DiscountController.text) : null,

                                                ),
                                              );

                                              if (isUpdated) {
                                                // list refresh
                                                loadData();
                                                Navigator.pop(context);
                                                ScaffoldMessenger.of(context).showSnackBar(
                                                  SnackBar(content: Text("Customer Updated Successfully",),backgroundColor: Colors.green,),
                                                );
                                              }
                                            },
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                TextButton(onPressed: (){
                                                  Navigator.pop(context);
                                                }, child: Text("Cancel", style: TextStyle(color: Colors.blue),)),
                                                SizedBox(width: 51,),
                                                Text("Save Changes", style: TextStyle(color: Colors.blue),),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            icon: Icon(Icons.edit, color: Colors.blue),
                          ),
                          /// delete
                          IconButton(onPressed: (){
                            DbHelper.getInstance().deleteCustomer(mAddCustomer[inex]['customerId']);
                            Navigator.pop(context);
                          }, icon: Icon(Icons.delete_forever_outlined, color: Colors.red,)),
                        ],),
                      ),
                    ],
                  ),
                  subtitle: Text(mAddCustomer[inex]['customerGst'] ?? ""),
                ),
                            ),
              );
          }): Center(child: Text("No Customer added yet!"),),
          Padding(
            padding: const EdgeInsets.all(21),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
              Align(
                alignment: Alignment.bottomRight,
                child: SizedBox(
                  height: 55,
                  width: 175,
                  child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                    onPressed: (){

                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (context) {
                          final appBarHeight = AppBar().preferredSize.height;

                          return SafeArea(
                            child: Container(
                              width: double.infinity,
                              height: 815,
                              padding: EdgeInsets.all(16),
                              child: Column(
                                children: [
                                  Text(
                                    "Add customer Details",
                                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.blue,),
                                  ),
                                  SizedBox(height: 5),
                                  TextField(
                                    controller: GstNumberController,
                                    decoration: InputDecoration(
                                      hint: Text("Gst Number", style: TextStyle(fontSize: 18, color: Colors.grey, fontWeight: FontWeight.bold),),
                                  ),
                                  ),
                                  SizedBox(height: 5),
                                  TextField(
                                    controller: CustomerNameController,
                                    decoration: InputDecoration(
                                      hint: Text("Customer Name", style: TextStyle(fontSize: 18, color: Colors.grey, fontWeight: FontWeight.bold),),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  TextField(
                                    controller: CustomerAccountTypeController,
                                    decoration: InputDecoration(
                                      hint: Text("Customer Account Type", style: TextStyle(fontSize: 18, color: Colors.grey, fontWeight: FontWeight.bold),),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  TextField(
                                    controller: Address1Controller,
                                    decoration: InputDecoration(
                                      hint: Text("Address1", style: TextStyle(fontSize: 18, color: Colors.grey, fontWeight: FontWeight.bold),),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  TextField(
                                    controller: Address2Controller,
                                    decoration: InputDecoration(
                                      hint: Text("Address2", style: TextStyle(fontSize: 18, color: Colors.grey, fontWeight: FontWeight.bold),),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  TextField(
                                    controller: CityController,
                                    decoration: InputDecoration(
                                      hint: Text("City", style: TextStyle(fontSize: 18, color: Colors.grey, fontWeight: FontWeight.bold),),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  TextField(
                                    controller: PinCodeController,
                                    decoration: InputDecoration(
                                      hint: Text("PinCode", style: TextStyle(fontSize: 18, color: Colors.grey, fontWeight: FontWeight.bold),),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  TextField(
                                    controller: StateController,
                                    decoration: InputDecoration(
                                      hint: Text("State", style: TextStyle(fontSize: 18, color: Colors.grey, fontWeight: FontWeight.bold),),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  TextField(
                                    controller: DistanceController,
                                    decoration: InputDecoration(
                                      hint: Text("Distance", style: TextStyle(fontSize: 18, color: Colors.grey, fontWeight: FontWeight.bold),),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  TextField(
                                    controller: MobNumberController,
                                    decoration: InputDecoration(
                                      hint: Text("MobileNumber", style: TextStyle(fontSize: 15, color: Colors.grey, fontWeight: FontWeight.bold),),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  TextField(
                                    controller: EmailController,
                                    decoration: InputDecoration(
                                      hint: Text("Email", style: TextStyle(fontSize: 18, color: Colors.grey, fontWeight: FontWeight.bold),),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  TextField(
                                    controller: TransPortController,
                                    decoration: InputDecoration(
                                      hint: Text("Transport", style: TextStyle(fontSize: 18, color: Colors.grey, fontWeight: FontWeight.bold),),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  TextField(
                                    controller: DiscountController,
                                    decoration: InputDecoration(
                                      hint: Text("Discount", style: TextStyle(fontSize: 18, color: Colors.grey, fontWeight: FontWeight.bold),),
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blue,
                                        foregroundColor: Colors.white,
                                      ),
                                      onPressed: ()async{
                                         bool isAdded = await DbHelper.getInstance().addCustomer(
                                           addNewCustomer: CustomerModel(
                                             id: null,
                                             gstNumber: GstNumberController.text,
                                             name: CustomerNameController.text,
                                             customerAccountType: CustomerAccountTypeController.text,
                                             address1: Address1Controller.text,
                                             address2: Address2Controller.text,
                                             city: CityController.text,
                                             pinCode: PinCodeController.text.isNotEmpty ? int.parse(PinCodeController.text) : null,
                                             state: StateController.text,
                                             distance: DistanceController.text.isNotEmpty ? int.parse(DistanceController.text) : null,
                                             mobNumber: MobNumberController.text,
                                             email: EmailController.text,
                                             transport: TransPortController.text,
                                             discount: DiscountController.text.isNotEmpty ? int.parse(DiscountController.text) : null,),
                                         );
                                         if(isAdded){
                                           loadData();
                                           ScaffoldMessenger.of(context).showSnackBar(
                                               SnackBar(content: Text("Customer Added Successfully"),backgroundColor: Colors.green.shade300,));
                                         }
                                        /// space clear
                                        GstNumberController.clear();
                                        CustomerNameController.clear();
                                        CustomerAccountTypeController.clear();
                                        Address1Controller.clear();
                                        Address2Controller.clear();
                                        CityController.clear();
                                        PinCodeController.clear();
                                        StateController.clear();
                                        DistanceController.clear();
                                        MobNumberController.clear();
                                        EmailController.clear();
                                        TransPortController.clear();
                                        DiscountController.clear();
                                        Navigator.pop(context);
                                      },
                                      child: Text("Save Customer")),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Row(
                      children: [
                        Icon(Icons.person_rounded),
                        SizedBox(width: 6,),
                        Text("Add Customer", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                      ],
                    )),
                ),
              )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}




