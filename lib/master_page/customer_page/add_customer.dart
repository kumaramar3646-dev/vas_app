import 'package:flutter/material.dart';
import 'package:vas_app/data/db_helper.dart';

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
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: mAddCustomer.isNotEmpty ? ListView.builder(
          itemCount: mAddCustomer.length,
          itemBuilder: (_, inex){
        return ListTile(
          title: Text(mAddCustomer[inex]['customerName'] ?? ""),
          //subtitle: Text(mAddCustomer[inex]['customerGst']),
        );
      }): Padding(
        padding: const EdgeInsets.all(21),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
          Align(
            alignment: Alignment.bottomRight,
            child: SizedBox(
              height: 50,
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
                                        colCustomerGst: GstNumberController.text,
                                        colCustomerName: CustomerNameController.text,
                                        colAccountType: CustomerAccountTypeController.text,
                                        colCustomerAddress1: Address1Controller.text,
                                        colCustomerAddress2: Address2Controller.text,
                                        colCustomerCity: CityController.text,
                                        colCustomerPinCode: PinCodeController.text,
                                        colCustomerState: StateController.text,
                                        colCustomerDistance: DistanceController.text,
                                        colCustomerMobile: MobNumberController.text,
                                        colCustomerEmail: EmailController.text,
                                        colCustomerTransport: TransPortController.text,
                                        colCustomerDiscount: DiscountController.text,
                                    );
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
                                    if(isAdded){
                                      loadData();
                                      ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(content: Text("Customer Added Successfully")));
                                    }
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
    );
  }

}




