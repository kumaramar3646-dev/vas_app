import 'package:flutter/material.dart';
//import 'package:vas_app/domain/app_constants.dart';
import 'package:vas_app/domain/module/sale_module.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Row(
              children: [
                Icon(Icons.menu, size: 30,),
                SizedBox(width: 20,),
                Text("InexpApp", style:  TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                SizedBox(width: 70,),
                Icon(Icons.perm_phone_msg_outlined, size: 30,),
                SizedBox(width: 25,),
                Icon(Icons.qr_code_scanner, size: 30,),
                SizedBox(width: 25,),
                Icon(Icons.notifications, size: 30,),
              ],
            ),
          ],
        ),
        backgroundColor: Colors.blue.shade700,
        foregroundColor: Colors.white,
      ),
      body:  Column(
        children: [

        ],
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          onPressed: (){
            showModalBottomSheet(

                context: context,
                builder: (index){
                  return Padding(
                    padding: const EdgeInsets.all(11),
                    child: Container(
                      width: double.infinity,
                      child: Column(
                        children: [
                          Text("Select type", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                          SizedBox(height: 31,),
                          Row(children: [
                            Text("Sale", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                            SizedBox(width: 51,),
                            InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => SaleModule()));
                                },

                                child: Icon(Icons.shopping_cart_checkout_rounded, size: 100,))
                          ],),
                          Divider(),
                          Row(children: [
                            Text("Purchase", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                            Icon(Icons.shopping_bag_outlined, size: 100,),
                          ],),
                          Divider(),
                          Row(children: [
                            Text("Return", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                            SizedBox(width: 41),
                            Icon(Icons.arrow_back_ios_new_rounded, size: 100,),
                          ],),
                        ],
                      ),
                    ),
                  );
            });
      },child: Icon(Icons.add, color: Colors.white,),),
    );
  }
}
