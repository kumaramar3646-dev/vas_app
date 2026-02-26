import 'package:flutter/material.dart';
import 'package:vas_app/master_page/category_page/add_category.dart';
import 'package:vas_app/master_page/transport_page/add_transport.dart';

import '../../master_page/customer_page/add_customer.dart';
import '../../master_page/item_page/Add_item.dart';

class SaleChallan extends StatefulWidget {

  @override
  State<SaleChallan> createState() => _SaleChallanState();
}

class _SaleChallanState extends State<SaleChallan> {
  var dateController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sale Challan ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
        backgroundColor: Colors.lightBlueAccent,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Column(
        children: [
           Text("Add Challan"),
          TextField(
            decoration: InputDecoration(
              hint: Text("ChallanNo"),
            ),
          ),
          SizedBox(height: 31,),
          TextField(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => AddCustomer()));
            },
            decoration: InputDecoration(
              hint: Text("Customer Name"),
              prefixIcon: Icon(Icons.person_rounded),
              suffixIcon: Icon(Icons.arrow_forward_ios_outlined, size: 15,),
            ),
          ),
          SizedBox(height: 21,),
          TextField(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => AddCategory()));
            },
            decoration: InputDecoration(
              hint: Text("Select Category"),
              prefixIcon: Icon(Icons.category),
              suffixIcon: Icon(Icons.arrow_forward_ios_outlined, size: 15,),
            ),
          ),
          SizedBox(height: 21,),
          TextField(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => AddTransport()));
            },
            decoration: InputDecoration(
              hint: Text("Select Transport"),
              suffixIcon: Icon(Icons.arrow_forward_ios_outlined, size: 15,),
              prefixIcon: Icon(Icons.emoji_transportation),
            ),
          ),
          SizedBox(height: 21,),
          TextField(
            decoration: InputDecoration(
              hint: Text("Discount %"),
              //suffixIcon: Icon(Icons.arrow_forward_ios_outlined, size: 15,),
              prefixIcon: Icon(Icons.discount),
            ),
          ),
          SizedBox(height: 21,),
          TextField(
            controller: dateController,
            readOnly: true,
            onTap: ()async{
              DateTime? pickedDate = await showDatePicker(
                  context: context,
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2030),
                  initialDate: DateTime.now(),
              );
              if(pickedDate != null){
                String formattedDate = "${pickedDate.day}-${pickedDate.month}-${pickedDate.year}";
                dateController.text = formattedDate;
              }
            },
            decoration: InputDecoration(
              hint: Text("Challan Date"),
              prefixIcon: Icon(Icons.calendar_month),

            ),
            ),
          SizedBox(height: 21,),
          TextField(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => AddItem()));
            },
            decoration: InputDecoration(
              hint: Text("Add Item"),
              prefixIcon: Icon(Icons.add_shopping_cart),
              suffixIcon: Icon(Icons.arrow_forward_ios_outlined, size: 15,),
            ),
          ),
          SizedBox(height: 31,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: (){}, child: Text("Save ")),
              ElevatedButton(onPressed: (){}, child: Text("Edit ")),
              ElevatedButton(onPressed: (){}, child: Text("Delete ")),
              ElevatedButton(onPressed: (){}, child: Text("Cancel ")),
            ],
          )

        ],
      ),
    );
  }
}
